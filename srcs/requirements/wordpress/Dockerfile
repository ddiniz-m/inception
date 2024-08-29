# WordPress

FROM debian:bullseye

RUN apt update && apt install -y php-fpm

COPY www.conf /etc/php/7.4/fpm/pool.d/.

# WORKDIR /var/www/html

# EXPOSE 8080

CMD ["php-fpm7.4", "-F"]
