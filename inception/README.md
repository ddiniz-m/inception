Makefile calls docker-compose.yml

docker-compose.yml calls Dockerfile

Dockerfile builds Docker Image using 'docker build' command
    Defines:
    - Environment
    - Base Image
    - Dependecies
    - Files to copy
    - Commands to run

Run the Docker Container using 'docker run'

Manage running Container
    - 'docker ps' to monitor running containers
    - 'docker stop' and 'docker start'
    - 'docker rm' and 'docker logs'

I have to create 3 dockerfiles, one for each needed image (MariaDB, NGINX, WordPress)

MariaDB
 - Open-source Relational Database Management System (RDBMS)
 - Replacement for MySQL. Compatible with it.
 - Have to create mdb-conf.sh script
 -

NGINX
 - Open-source web server and reverse proxy software
 - How it works:
    - Handling HTTP/HTTPS requests
    - Static content delivery
    - Reverse Proxying
    - Load Balancing
    - Caching
    - SSL/TLS Termination (Secure Socket Layers, Transport Layer Security)