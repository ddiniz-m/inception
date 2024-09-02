# NGINX

FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y nginx

COPY default /etc/nginx/sites-available/.

EXPOSE 8080

LABEL description = "Engine X!"

CMD [ "nginx", "-g", "daemon off;" ]

# -g makes it so nginx runs in the foreground
# daemon off makes it so that the container wont exit abruptly after we power it on
