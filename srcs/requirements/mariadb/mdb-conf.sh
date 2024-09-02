#!/bin/bash

if [ ! -d "/var/lib/mysql/mysql" ]; then

	mysql_install_db

	mysqld

	mysql -u root -p < /etc/mysql/init.sql

fi