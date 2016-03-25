#!/bin/bash
chmod 777 -R /travel/www/travel_dev/var
/usr/local/sbin/php-fpm
service nginx start
tail -f /dev/null