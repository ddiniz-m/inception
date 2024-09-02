#!/bin/bash

cd /var/www/html

# Intallation of wp-cli. wp-cli is the command-line interface for WordPress.
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod 777 wp-cli.phar

./wp-cli.phar core download --allow-root

./wp-cli.phar config create --path=/var/www/html/ --dbname=wordpress --dbuser=wpUser --dbpass=dbpass --dbhost=mariadb --allow-root

./wp-cli.phar core install --url=localhost --title=inception --admin_user=ddiniz-m --admin_password=adminpass --admin_email=admin@admin.com --allow-root

./wp-cli.phar user create --allow-root --user_pass=userpass