
NAME		=	inception

# -f	Compose configuration files
# up	Create and start containers
build:
	docker compose -f srcs/docker-compose.yml up -d --build

stop:
	docker compose -f srcs/docker-compose.yml stop

clean:
	docker compose -f srcs/docker-compose.yml down --volumes --rmi all

fclean: clean
	docker system prune -a --volumes --force

re: fclean build