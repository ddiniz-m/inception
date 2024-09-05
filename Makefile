GREEN		=	\033[0;32m
RED			=	\033[0;31m
YELLOW		=	\033[0;33m
END			=	\033[0m

NAME		=	inception

# -f	Compose configuration files
# up	Create and start containers
build: dirs
	@echo "$(GREEN)Docker Compose Starting!$(NC)"
	@docker compose -f srcs/docker-compose.yml up --build

dirs:
	@if [ ! -d "/home/ddiniz-m/data/mariadb" ]; then \
		echo "$(YELLOW)Mariadb Volume Directory Created!$(NC)" && \
		mkdir -p /home/ddiniz-m/data/mariadb; \
	fi
	@if [ ! -d "/home/ddiniz-m/data/wordpress" ]; then \
		echo "$(YELLOW)Wordpress Volume Directory Created!$(NC)" && \
		mkdir -p /home/ddiniz-m/data/wordpress; \
	fi

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
	@rm -rf /home/ddiniz-m/data/

fclean: clean
	docker system prune -af --volumes --force


re: fclean build