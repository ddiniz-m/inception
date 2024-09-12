# MariaDB

FROM debian:bullseye

#gettext for envsubst
RUN apt update && apt upgrade -y && apt install -y \
	mariadb-server \
	nano \
	gettext

COPY 99-my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY init.sql /usr/local/bin/init.sql
COPY mdb-conf.sh /usr/local/bin/

RUN mkdir /var/run/mysqld

#Chown: Changes owner and/or group of folder/file. chown OWNER:GROUP FILE
RUN chown mysql:mysql /var/run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql

RUN chmod 755 /usr/local/bin/mdb-conf.sh \
	&& chmod 755 /etc/mysql/mariadb.conf.d/50-server.cnf \
	&& chmod -R 755 /var/lib/mysql

EXPOSE 3306

WORKDIR /usr/local/bin

ENTRYPOINT ["mdb-conf.sh"]