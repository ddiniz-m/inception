# MariaDB

FROM debian:bullseye

RUN apt update && apt-get install -y mariadb-server

EXPOSE 3306

LABEL description="MariaDB Server"

CMD ["mariadb"]