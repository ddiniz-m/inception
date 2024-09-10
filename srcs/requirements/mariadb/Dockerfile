# MariaDB

FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
	mariadb-server \
	nano \
	gettext

COPY 99-my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY init.sql /usr/local/bin/init.sql
COPY mdb-conf.sh /usr/local/bin/

RUN mkdir /var/run/mysqld
RUN chown mysql:mysql /var/run/mysqld
RUN chmod 755 /usr/local/bin/mdb-conf.sh
RUN chmod 755 /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chown -R mysql:mysql /var/lib/mysql \
	&& chmod -R 755 /var/lib/mysql

EXPOSE 3306

LABEL description = "MariaDB!"

WORKDIR /usr/local/bin

ENTRYPOINT ["mdb-conf.sh"]