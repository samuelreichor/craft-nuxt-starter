ARG php_version=8.4
ARG node_version=24

### Stage 1: Nuxt Build Environment
FROM node:${node_version}-alpine AS nuxtbuilder

# Nuxt reads these in nuxt.config.ts at build time (craftcms baseUrl + siteMap),
# so they have to be passed in as build args, not only as runtime env vars.
ARG NUXT_PRIMARY_SITE_URL
ARG NUXT_PRIMARY_SITE_URL_DE
ARG NUXT_PRIMARY_SITE_URL_ES
ARG NUXT_CRAFT_TOKEN
ENV NUXT_PRIMARY_SITE_URL=${NUXT_PRIMARY_SITE_URL} \
  NUXT_PRIMARY_SITE_URL_DE=${NUXT_PRIMARY_SITE_URL_DE} \
  NUXT_PRIMARY_SITE_URL_ES=${NUXT_PRIMARY_SITE_URL_ES} \
  NUXT_CRAFT_TOKEN=${NUXT_CRAFT_TOKEN}

WORKDIR /app

COPY package.json package-lock.json ./
COPY frontend/package.json ./frontend/

# --ignore-scripts skips the `nuxt prepare` postinstall, which needs the frontend
# sources. `nuxt build` runs prepare itself later.
RUN npm ci --ignore-scripts

COPY frontend ./frontend

RUN npm run build

### Stage 2: Nuxt Server - runs the Nitro SSR server
FROM node:${node_version}-alpine AS nuxt

ENV NODE_ENV=production \
  HOST=0.0.0.0 \
  PORT=3000

WORKDIR /app

COPY --from=nuxtbuilder --chown=node:node /app/frontend/.output ./.output

USER node

EXPOSE 3000

CMD ["node", ".output/server/index.mjs"]

### Stage 3a: CLI base — PHP CLI image with all required extensions.
# Compiled once and reused by both the vendor and queue stages, so we only
# pay the intl/imagick compile cost a single time per build instead of twice.
# Stays in the Docker layer cache as long as the extension list is unchanged.
FROM serversideup/php:${php_version}-cli-alpine AS cli-base

USER root

# bcmath required by craftcms/cms + moneyphp/money, gd required by phpoffice/phpspreadsheet,
# intl required by craftcms/cms, imagick for Craft's image transforms.
RUN install-php-extensions bcmath gd intl imagick

### Stage 3b: Composer Dependencies
# Resolves PHP packages once and is reused by web + queue stages.
FROM cli-base AS vendor

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apk add --no-cache git unzip

WORKDIR /app

COPY composer.json composer.lock ./

# --no-scripts skips composer hooks that need a working DB connection or the
# project sources. --no-autoloader because the PSR-4 modules/ aren't copied yet.
RUN composer install --no-interaction --no-dev --no-scripts --no-autoloader

COPY modules ./modules

RUN composer dump-autoload --no-dev --optimize

### Stage 4: Web (nginx + php-fpm via s6-overlay)
FROM serversideup/php:${php_version}-fpm-nginx-alpine AS web

USER root

# Point nginx at Craft's web root and enable opcache for production.
ENV NGINX_WEBROOT=/app/web
ENV PHP_OPCACHE_ENABLE=1

# mariadb-connector + mysql-client are needed for craft db/backup + mysqldump.
RUN install-php-extensions bcmath gd intl imagick \
  && apk add --no-cache git unzip bash vim mariadb-connector-c mysql-client

WORKDIR /app

COPY . .
COPY --from=vendor /app/vendor ./vendor

# Touch .env so the chown succeeds even when Coolify injects env vars at runtime
# instead of providing a .env file in the build context.
RUN mkdir -p /app/storage /app/web/cpresources /app/web/assets \
  && touch /app/.env \
  && chown -R www-data:www-data /app/config /app/storage /app/web/cpresources /app/web/assets /app/.env \
  && chmod -R 775 /app/config /app/storage /app/web/cpresources /app/web/assets /app/.env

USER www-data

### Stage 5: Queue Worker - runs craft queue/listen
FROM cli-base AS queue

RUN apk add --no-cache git unzip bash mariadb-connector-c mysql-client

WORKDIR /app

COPY . .
COPY --from=vendor /app/vendor ./vendor

RUN mkdir -p /app/storage /app/web/cpresources /app/web/assets \
  && touch /app/.env \
  && chown -R www-data:www-data /app/config /app/storage /app/web/cpresources /app/web/assets /app/.env \
  && chmod -R 775 /app/config /app/storage /app/web/cpresources /app/web/assets /app/.env

USER www-data

CMD ["php", "craft", "queue/listen", "--verbose"]
