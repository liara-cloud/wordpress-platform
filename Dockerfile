FROM wordpress:php7.2-apache

ONBUILD COPY . /var/www/html

ONBUILD RUN if [ -e /var/www/html/liara_php.ini ]; \
  then \
    echo 'Applying custom liara_php.ini...'; \
    mv /var/www/html/liara_php.ini /usr/local/etc/php/conf.d/liara_php.ini; \
  else \
    echo 'Applying default php.ini...'; \
fi

COPY wrapper-entrypoint.sh /usr/local/bin/

CMD /usr/local/bin/wrapper-entrypoint.sh