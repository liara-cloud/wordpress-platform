#!/bin/bash

set -m

if [ -e /var/www/html/liara_php.ini ]; \
  then \
    echo 'Applying custom liara_php.ini...'; \
    mv /var/www/html/liara_php.ini /usr/local/etc/php/conf.d/liara_php.ini; \
  else \
    echo 'Applying default php.ini...'; \
fi

/usr/local/bin/docker-entrypoint.sh apache2-foreground &

chown -R www-data:www-data /var/www/html/

fg %1
