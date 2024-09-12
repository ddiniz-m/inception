# NGINX

FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y nginx openssl

COPY nginx.conf /etc/nginx/conf.d

WORKDIR /etc/nginx/tls

RUN openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 \
	-subj "/C=PT/ST=Lisboa/L=Lisboa/O=School42/OU=Rank5/CN=Diogo" \
	-keyout ddiniz-m.key \
	-out ddiniz-m.crt

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]

# -g makes it so nginx runs in the foreground
# daemon off makes it so that the container wont exit abruptly after we power it on
