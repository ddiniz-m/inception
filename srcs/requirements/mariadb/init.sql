-- Creates DB called wordpress
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;
FLUSH PRIVILEGES ;

-- Creates new user MYSQL_USER that can connect from any host (%) with the password MYSQL_PASSWORD
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;
FLUSH PRIVILEGES ;

-- Grants all privileges to MYSQL_USER and allows to give all privileges to others
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;
FLUSH PRIVILEGES ;

-- ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;
-- FLUSH PRIVILEGES ;

-- Refreshes privilege table in MariaDB
FLUSH PRIVILEGES ;

USE $MYSQL_DATABASE ;