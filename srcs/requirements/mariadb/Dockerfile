# MariaDB

FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y --fix-broken --fix-missing \
	mariadb-server \
	nano

COPY 99-my.cnf /etc/mysql/mariadb.conf.d/
COPY init.sql /usr/local/bin/init.sql
COPY mdb-conf.sh /usr/local/bin/

RUN mkdir /var/run/mysqld \
	&& chown mysql:mysql /var/run/mysqld \
	&& chmod 755 /usr/local/bin/mdb-conf.sh \
	&& chmod 644 /etc/mysql/mariadb.conf.d/99-my.cnf

RUN chown -R mysql:mysql /var/lib/mysql \
	&& chmod -R 755 /var/lib/mysql

EXPOSE 3306

LABEL description = "MariaDB!"

ENTRYPOINT ["/usr/local/bin/mdb-conf.sh"]

# CMD ["mysqld_safe"]