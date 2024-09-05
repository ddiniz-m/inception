#!/bin/bash

wp_download()
{
	echo "1"
	wp core download --allow-root
}

config_create()
{
	echo "2"
	wp config create \
		--allow-root \
		--path=/var/www/html/ \
		--dbname=$DB_NAME \
		--dbuser=$DB_USER \
		--dbpass=$DB_PASSWORD \
		--dbhost=$DB_HOST
}

install()
{
	echo "3"
	wp core install \
		--allow-root \
		--url=$WP_URL \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN_USER \
		--admin_password=$WP_ADMIN_PW \
		--admin_email=$WP_ADMIN_EMAIL
}

user_create()
{
	echo "4"
	wp user create \
		--allow-root \
		$WP_USER $WP_USER_EMAIL \
		--user_pass=$WP_USER_PASS
}

funcs=( config_create install user_create )

wp_download

if [ ! -f /var/www/html/wp-config.php ]
then

	mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
	chmod 777 /var/www/html/wp-config.php

	sed -i -r "s/database_name_here/$DB_NAME/1" /var/www/html/wp-config.php
	sed -i -r "s/username_here/$DB_USER/1" /var/www/html/wp-config.php
	sed -i -r "s/password_here/$DB_PASSWORD/1" /var/www/html/wp-config.php
	sed -i -r "s/localhost/$DB_HOST/1" /var/www/html/wp-config.php

	chown -R www-data:www-data /var/www/html/wp-config.php
	chmod 640 wp-config.php

	for run in "${funcs[@]}"
	do
		$run
	done
else
	echo "Wordpress is already installed and configured!"
fi

exec php-fpm7.4 -R -F