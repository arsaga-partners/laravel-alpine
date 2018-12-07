FROM php:7.2-fpm-alpine
MAINTAINER arsaga

RUN docker-php-ext-install mbstring && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install opcache && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \ 
    composer global require hirak/prestissimo && \
    apk add --update --no-cache autoconf g++ imagemagick-dev libtool make pcre-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick
