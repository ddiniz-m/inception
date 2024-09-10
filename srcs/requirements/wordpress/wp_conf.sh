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
		--path=/var/www/html/ \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=mariadb:3306 \
		--allow-root \
		--force
}

install()
{
	echo "3"
	wp core install \
		--allow-root \
		--url=$WP_URL/ \
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
		--user_pass=$WP_USER_PASS \
		--role=author
}

if [ ! -f wp-config.php ]
then
	wp_download
	config_create
	install
	user_create

	wp option update home "https://$WP_URL" --allow-root
	wp option update siteurl "https://$WP_URL" --allow-root

else
	echo "Wordpress is already installed and configured!"
fi

exec $@