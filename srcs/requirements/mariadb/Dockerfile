# MariaDB

FROM debian:bullseye

RUN apt update && apt upgrade -y && apt-get install -y mariadb-server

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY init.sql /etc/mysql/init.sql
COPY mdb-conf.sh /home

RUN mkdir /run/mysqld

EXPOSE 3306

LABEL description = "MariaDB!"

ENTRYPOINT ["/home/mdb-conf.sh"]

CMD ["mysqld_safe"]