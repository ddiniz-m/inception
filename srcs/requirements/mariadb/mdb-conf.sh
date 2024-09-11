#!/bin/bash

mysqld_safe &

while ! mysqladmin ping --silent; do
    echo "Waiting for MariaDB to start..."
    sleep 2
done

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then

	echo "Setting up MYSQL!!!"

	envsubst < init.sql > tmp.sql

	mysql -u root < tmp.sql
	
else
	echo "MariaDB already configured!"
fi

wait