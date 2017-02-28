FROM php:5.6-apache

# install modules and extensions for apache and php
RUN apt-get update \
    && apt-get install -y \
          libicu-dev \
          libfreetype6-dev \
          libjpeg62-turbo-dev \
          libmcrypt-dev \
          libpng12-dev \
          nano \
          net-tools \
          libmagickwand-dev \
          php5-dev \
          autoconf\
          g++\
          libxml2-dev\
          libtool\
          make\

    && docker-php-ext-install -j$(nproc) iconv mcrypt intl mbstring mysqli mysql pdo_mysql exif sockets soap \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && pecl install imagick \
    && pecl install xdebug \
    && docker-php-ext-enable \
        opcache \
        imagick \
        xdebug \
    && a2enmod rewrite expires deflate ssl headers

# expose ports
EXPOSE 80
EXPOSE 443
