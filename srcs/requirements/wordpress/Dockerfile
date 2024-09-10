# WordPress

FROM debian:bullseye

#php-mysqli is needed to give php access to our database
#curl is needed to download the sript for installing the worpress website
RUN apt update && apt upgrade -y && apt install -y \
	curl \
	nano \
    php7.4-fpm \
    php7.4-mysql \
	mariadb-server

# Intallation of wp-cli. wp-cli is the command-line interface for WordPress.
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod 755 wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php \
	&& mkdir -p /var/www/html \
	&& chmod -R 755 /var/www/html \
	&& chown -R www-data:www-data /var/www/html

COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY wp_conf.sh /usr/local/bin/
COPY index.html /var/www/html

RUN chmod 755 /usr/local/bin/wp_conf.sh

EXPOSE 9000

LABEL description = "WordPress!"

WORKDIR /var/www/html

ENTRYPOINT [ "/usr/local/bin/wp_conf.sh" ]

CMD [ "/usr/sbin/php-fpm7.4 -F -R" ]
