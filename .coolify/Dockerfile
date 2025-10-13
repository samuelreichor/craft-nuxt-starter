# Versions: only change them here.
ARG PHP_VERSION=8.4
ARG NODE_VERSION=24

### Nuxt build
FROM node:${NODE_VERSION}-alpine AS nuxtbuilder

# Nuxt reads these in nuxt.config.ts at build time (craftcms baseUrl + siteMap).
# Coolify passes its build variables as build args; Docker only hands over the
# ones declared here, and they are visible as env vars during `npm run build`.
ARG NUXT_PRIMARY_SITE_URL
ARG NUXT_PRIMARY_SITE_URL_DE
ARG NUXT_PRIMARY_SITE_URL_ES
ARG NUXT_CRAFT_TOKEN

WORKDIR /app

COPY package.json package-lock.json ./
COPY frontend/package.json ./frontend/

# --ignore-scripts skips the `nuxt prepare` postinstall, which needs the frontend
# sources. `nuxt build` runs prepare itself later.
RUN npm ci --ignore-scripts

COPY frontend ./frontend

RUN npm run build

### Nuxt server - runs the Nitro SSR server (target: nuxt)
FROM node:${NODE_VERSION}-alpine AS nuxt

ENV NODE_ENV=production \
  HOST=0.0.0.0 \
  PORT=3000

WORKDIR /app

COPY --from=nuxtbuilder --chown=node:node /app/frontend/.output ./.output

USER node

EXPOSE 3000

CMD ["node", ".output/server/index.mjs"]

### Craft (web + queue)
FROM ghcr.io/samuelreichor/craftcms-docker:${PHP_VERSION}

# Serves Craft and proxies everything else to the nuxt service on the same domain.
# Replaces the whole site config instead of adding snippets to server-opts.d.
COPY .coolify/nginx/http.conf.template /etc/nginx/site-opts.d/http.conf.template

# Code and dependencies belong to root, so PHP can't modify them.
USER root

# Dependencies first, so they stay cached until composer.lock changes.
# --no-scripts skips hooks that need a DB connection, --no-autoloader because
# the PSR-4 modules/ aren't copied yet.
COPY composer.json composer.lock ./
RUN composer install --no-interaction --no-dev --no-scripts --no-autoloader

COPY . .

# COPY resets folders that exist in the repo (e.g. storage/) to root, so hand
# Craft's writable paths back to www-data.
RUN composer dump-autoload --no-dev --optimize \
  && chown -R www-data:www-data storage web/cpresources web/assets .env

USER www-data
