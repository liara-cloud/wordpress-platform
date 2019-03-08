FROM wordpress:php7.2-apache

ONBUILD COPY . /var/www/html

ONBUILD RUN chown -R www-data:www-data /var/www/html/ && chmod -R 766 /var/www/html/