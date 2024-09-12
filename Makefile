GREEN		=	\033[0;32m
RED			=	\033[0;31m
YELLOW		=	\033[0;33m
NC			=	\033[0m

NAME		=	inception

# -f	Compose configuration files
# up	Create and start containers
all: build

build: dirs secrets
	@echo "$(GREEN)Docker Compose Starting!$(NC)"
	@docker compose -f srcs/docker-compose.yml up --build

dirs:
	@if [ ! -d "/home/ddiniz-m/data/mariadb" ]; then \
		echo "$(YELLOW)Mariadb Volume Directory Created!$(NC)" ; \
		mkdir -p /home/ddiniz-m/data/mariadb ; \
	fi
	@if [ ! -d "/home/ddiniz-m/data/wordpress" ]; then \
		echo "$(YELLOW)Wordpress Volume Directory Created!$(NC)" ; \
		mkdir -p /home/ddiniz-m/data/wordpress ; \
	fi

secrets:
	@if docker info 2>&1 | grep '^ Swarm: inactive'; then \
		echo "$(GREEN)Initializing Docker Swarm...$(NC)";  \
		docker swarm init ; \
		chmod 755 srcs/create_secrets.sh ; \
		echo "$(GREEN)Creating Docker Secrets...$(NC)" ; \
		./srcs/create_secrets.sh ; \
	fi

stop:
	@docker compose -f srcs/docker-compose.yml stop

clean:
	@if docker info 2>&1 | grep '^ Swarm: active' ; then \
		echo "$(RED)Leaving Docker Swarm...$(NC)" ; \
		docker swarm leave --force ; \
	fi
	@echo "$(RED)Cleaning up containers and volumes...$(NC)"
	@docker compose -f srcs/docker-compose.yml down --volumes --rmi all
	@rm -rf /home/ddiniz-m/data/

fclean: clean
	@echo "$(RED)System pruning...$(NC)"
	@docker system prune -af --volumes --force


re: fclean build

.PHONY: all build dirs secrets stop clean fclean re