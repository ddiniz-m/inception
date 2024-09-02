# WordPress

FROM debian:bullseye

#php-mysqli is needed to give php access to our database
#curl is needed to download the sript for installing the worpress website
RUN apt update && apt upgrade -y && apt install -y \
	curl \
	php-fpm \
	php-mysqli

RUN mkdir -p /run/php

COPY www.conf /etc/php/7.4/fpm/pool.d/.
COPY wp_conf.sh /home
COPY wp-config.php /home

RUN chmod 777 /home/wp_conf.sh

EXPOSE 9000

LABEL description = "WordPress!"

ENTRYPOINT [ "/home/wp_conf.sh" ]

CMD ["php-fpm7.4 -F"]
