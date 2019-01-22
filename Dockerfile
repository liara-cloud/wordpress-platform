FROM wordpress:php7.2-apache

ONBUILD COPY . /var/www/html