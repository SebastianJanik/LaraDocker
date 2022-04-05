FROM php:8.1.4-apache

RUN apt-get update
RUN apt-get install -y libpq-dev
RUN docker-php-ext-install pdo pdo_pgsql

COPY ./myvhost.conf /etc/apache2/sites-available/myvhost.conf

RUN a2enmod rewrite
RUN a2ensite myvhost.conf

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
