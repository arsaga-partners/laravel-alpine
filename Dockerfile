FROM php:7.3-fpm-alpine3.11
MAINTAINER arsaga
RUN apk --update add zlib-dev \
    libmcrypt-dev \
    libpng-dev \
    libzip-dev \
    && rm -rf /var/cache/apk/* && \
    docker-php-ext-install mbstring && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install opcache && \
    docker-php-ext-install zip && \
    docker-php-ext-install gd && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \ 
    composer global require hirak/prestissimo && \
    apk add --update --no-cache autoconf g++ imagemagick-dev libtool make pcre-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick
RUN apk update \
    && apk add \
    libmemcached-dev \
    gcc \
    && pecl install memcached