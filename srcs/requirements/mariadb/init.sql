
-- Creayed DB called wordpress
CREATE DATABASE wordpress;

-- Creates new user wpUser that can connect from any host ('%') with the password "password"
CREATE USER 'wpUser'@'%' IDENTIFIED BY 'password';

-- Grantes all privileges to wpUser and allows to give all privileges to others
GRANT ALL PRIVILEGES ON *.* TO 'wpUser'@'%' WITH GRANT OPTION;

-- Refreshes privilege table in MariaDB
FLUSH PRIVILEGES;