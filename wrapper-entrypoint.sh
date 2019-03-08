#!/bin/bash

set -m

/usr/local/bin/docker-entrypoint.sh apache2-foreground &

chown -R www-data:www-data /var/www/html/

fg %1
