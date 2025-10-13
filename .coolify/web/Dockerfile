ARG php_version
FROM ghcr.io/craftcms/image:${php_version}

USER root

# copy the files from the host to the container that we need
RUN rm /etc/nginx/sites-enabled/default
COPY ./.coolify/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./.coolify/nginx/nginx.ini /etc/supervisord.d/nginx.ini
COPY ./.coolify/nginx/craftcms /etc/nginx/craftcms
RUN mkdir -p /etc/nginx/sites-enabled
COPY ./.coolify/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

# set the sockets and pid files to be writable by the appuser
RUN mkdir -p /var/log/nginx && chown -R appuser:appgroup /var/log/nginx
RUN chown -R appuser:appgroup /var/lib/nginx && touch /run/nginx.pid && chown -R appuser:appgroup /run/nginx.pid

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Install other packages
RUN apt-get update && apt-get install -y --no-install-recommends \
  unzip bash vim \
  default-mysql-client libmariadb3 \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app
USER appuser

COPY composer.json composer.lock ./
RUN composer install --no-interaction --no-dev --optimize-autoloader

COPY --chown=appuser:appgroup . .

EXPOSE 9000 8080 80
