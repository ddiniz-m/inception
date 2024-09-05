#!/bin/bash

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then

	mysqld --initialize-insecure

	mysqld -u root -p $DB_PASS < /etc/mysql/init.sql

	mysqadmin shutdown

else
	echo "MariaDB already configured!"
fi

exec mysqld_safe