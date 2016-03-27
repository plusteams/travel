#!/bin/bash
chmod 777 -R /travel/www/travel_dev/var
chmod 777 -R /travel/www/travel/var
/usr/local/sbin/php-fpm
service nginx start
cd /travel/www/travel/
php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
php -r "if (hash('SHA384', file_get_contents('composer-setup.php')) === '41e71d86b40f28e771d4bb662b997f79625196afcca95a5abf44391188c695c6c1456e16154c75a211d238cc3bc5cb47') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php --install-dir=/usr/bin --filename=composer
php -r "unlink('composer-setup.php');"
composer install --no-scripts --prefer-source --prefer-dist
chmod a+x /travel/www/travel/vendor/autoload.php
cp /travel/www/travel/app/config/parameters.yml.dist /travel/www/travel/app/config/parameters.yml
tail -f /dev/null