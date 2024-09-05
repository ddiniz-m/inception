# MariaDB

FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y mariadb-server nano

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY init.sql /etc/mysql/init.sql
COPY mdb-conf.sh /usr/local/bin/

RUN mkdir /var/run/mysqld \
	&& chmod 777 /usr/local/bin/mdb-conf.sh

EXPOSE 3306

LABEL description = "MariaDB!"

ENTRYPOINT ["/usr/local/bin/mdb-conf.sh"]

# CMD ["mysqld_safe"]