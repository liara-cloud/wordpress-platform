FROM wordpress:php7.2-apache

ONBUILD COPY . /var/www/html

COPY wrapper-entrypoint.sh /usr/local/bin/

CMD /usr/local/bin/wrapper-entrypoint.sh