FROM wordpress:5.3.2-php7.2-apache

RUN curl -fsSL 'https://www.sourceguardian.com/loaders/download/loaders.linux-x86_64.tar.gz' -o sourceguardian.tar.gz \
  && mkdir -p /tmp/sourceguardian \
  && tar -xvvzf sourceguardian.tar.gz -C /tmp/sourceguardian \
  && mv /tmp/sourceguardian/ixed.7.2.lin `php-config --extension-dir` \
  && rm -Rf sourceguardian.tar.gz /tmp/sourceguardian \
  && docker-php-ext-enable ixed.7.2.lin \
  && curl -fsSL 'https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz' -o ioncube.tar.gz \
  && tar -xvvzf ioncube.tar.gz -C /tmp \
  && mv /tmp/ioncube/ioncube_loader_lin_7.2.so `php-config --extension-dir` \
  && rm -Rf ioncube.tar.gz /tmp/ioncube \
  && docker-php-ext-enable ioncube_loader_lin_7.2

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
