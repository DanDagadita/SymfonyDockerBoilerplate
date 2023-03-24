FROM php:8.2-fpm

WORKDIR /srv/app

RUN apt-get update \
    && apt-get -y install git zip libpq-dev libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl pdo php-mysql

RUN curl -sL https://getcomposer.org/installer | php -- --install-dir /usr/bin --filename composer

RUN apt-get update && apt-get -y install npm && npm install -g n && n lts

CMD ["php-fpm"]