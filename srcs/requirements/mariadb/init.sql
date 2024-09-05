-- Creates DB called wordpress
CREATE DATABASE IF NOT EXISTS `$DB_NAME` ;

-- Creates new user wpUser that can connect from any host (%) with the password password
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY `$DB_PASS` ;

-- Grantes all privileges to dbuser and allows to give all privileges to others
GRANT ALL PRIVILEGES ON `$DB_NAME` TO '$DB_USER'@'%' WITH GRANT OPTION ;

-- Refreshes privilege table in MariaDB
FLUSH PRIVILEGES ;