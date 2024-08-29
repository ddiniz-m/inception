# NGINX

FROM debian:bullseye

RUN apt update && apt install -y nginx

COPY default /etc/nginx/sites-available/.

EXPOSE 8080

CMD [ "nginx", "-g", "daemon off;" ]

# -g makes it so nginx runs in the foreground
# daemon off makes it so that the container wont exit abruptly after we power it on
