
NAME		=	inception

# -f	Compose configuration files
# up	Create and start containers
build:
	docker compose -f srcs/docker-compose.yml up --build

maria:
	docker compose -f srcs/requirements/mariadb/Dockerfile up

wp:
	docker compose -f srcs/requirements/wordpress/Dockerfile up

nginx:
	docker compose -f srcs/requirements/nginx/Dockerfile up

stop:
	docker compose -f srcs/docker-compose.yml stop

clean:
	docker compose -f srcs/docker-compose.yml down --volumes --rmi all
	rm -rf /var/www/html/wordpress
	rm -rf /srcs/database

fclean: clean
	docker system prune -a --volumes --force

re: fclean build