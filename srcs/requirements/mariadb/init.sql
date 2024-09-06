-- Creates DB called wordpress
CREATE DATABASE IF NOT EXISTS `$MYSQL_DATABASE` ;

-- Creates new user MYSQL_USER that can connect from any host (%) with the password MYSQL_PASSWORD
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;

-- Grantes all privileges to MYSQL_USER and allows to give all privileges to others
GRANT ALL PRIVILEGES ON `$MYSQL_DATABASE`.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION ;

-- Refreshes privilege table in MariaDB
FLUSH PRIVILEGES ;