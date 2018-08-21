FROM php:5.6.37-fpm-jessie
MAINTAINER Dmitrii Ageev <d.ageev@gmail.com>

RUN apt-get update && \
    apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libncurses5-dev \
        libicu-dev \
        libmemcached-dev \
        libcurl4-openssl-dev \
        libpng-dev \
        libpng12-dev \
        libgmp-dev \
        libxml2-dev \
        libgd2-dev \
        libldap2-dev \
        curl \
        zlib1g-dev \
        ssmtp

RUN apt-get install -y \
        antiword \
        poppler-utils \
        html2text \
        unrtf

RUN rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h

RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
    && docker-php-ext-install ldap \
    && docker-php-ext-configure mysql --with-mysql=mysqlnd \
    && docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install mysql \
    && docker-php-ext-install soap \
    && docker-php-ext-install intl \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install gd \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gmp \
    && docker-php-ext-install zip
