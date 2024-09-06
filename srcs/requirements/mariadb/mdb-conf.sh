#!/bin/bash

mysqld_safe --skip-networking &

sleep 3

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then

	echo "Setting up MYSQL!!!"
	mysql -u root -p $MYSQL_PASSWORD < /usr/local/bin/init.sql

else
	echo "MariaDB already configured!"
fi