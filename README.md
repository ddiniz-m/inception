# Theory

## Docker
- Containerization platform that allows user to package applications along with all their dependencies and confgurations into a container;
- Containers run on top of hots's OS's kernel, so multiple containers can share same OS;
- Avoids environment compatability issues;
- In this case Docker provides a Linux Environment within each container, making it able to run Linux commands on a machine with a different OS;
- If a user using macOS want to run my program, it has to use Docker Desktop. It automatically provides a lighweight Linux VM that runs the Docker daemon and handles container execution;
- Isolated environment but with some level of resource sharing due to sahring same OS;

### Useful use case:
- A company with a lot of employees need to use a new program. Every employee needs to install the program and configure it apropriately. Withut Docker, this would be a dificult task and would take a few days to due to erros and wrong configurations. Docker solves this issue by having the emplyees receive a container with all dependencies and configurations handled.

### Virtual Machines diferences
- Creates a new OS on top of host's OS;
- Consumes more resources due to OS and virtualized hardware;
- Slower startup times;
- Fully isolated independent environment;

## MariaDB
- Open-source Relational Database Management System (RDBMS)
- Replacement for MySQL. Compatible with it;

## NGINX
- Open-source web server and reverse proxy software
- How it works:
	- Handling HTTP/HTTPS requests
	- Static content delivery
	- Reverse Proxying
	- Load Balancing
	- Caching
	- SSL/TLS Termination (Secure Socket Layers, Transport Layer Security)

## Wordpress
- Content management system that allows users to create and manage websites 	without knowing how yo code

## PHP - PHP Hypertext Preprocessor (initially Personal Home Page)
- Server side scripting language;
- Handles client requests;
- Useful for generating HTML content dynamically (e.g. fetching database data) and displaying it on the browser.

## CGI - Common Gateway Interface
- Allows web servers to interact with external programs and scripts (e.g. PHP)

## PID 1 (or init)
- First process created on startup
- Runs until system shut down;
- Manages daemons;
- Adopts any parent process that exits before its child processes

## Daemons:
- Program that runs as a background process;
- It's parent process is often the init process;
Usually created by:
	- A process forking a child process an then immediatly exiting, thus causing init to adopt the child process;
	- The init process directly launching that daemon;
- Systems often start daemons at boot time that will respond to network requests or hardware acitvities;
- Cron is an example of a daemon (in this case, it performs tasks at scheduled times)

# Project:
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