DOCKER_COMPOSE = srcs/docker-compose.yml

DB_PATH = /home/wait-bab/data/db_data
WP_PATH = /home/wait-bab/data/wordpress_data

all: prepare
	sudo docker compose -f $(DOCKER_COMPOSE) up -d --build

prepare:
	@if [ ! -d "$(DB_PATH)" ]; then \
		echo "Creating $(DB_PATH)"; \
		mkdir -p "$(DB_PATH)"; \
	fi
	@if [ ! -d "$(WP_PATH)" ]; then \
		echo "Creating $(WP_PATH)"; \
		mkdir -p "$(WP_PATH)"; \
	fi

up:
	sudo docker compose -f ${DOCKER_COMPOSE} up -d

down:
	sudo docker compose -f ${DOCKER_COMPOSE} down

stop:
	sudo docker compose -f ${DOCKER_COMPOSE} stop

start:
	sudo docker compose -f ${DOCKER_COMPOSE} start

restart:
	sudo docker compose -f ${DOCKER_COMPOSE} restart

build:
	sudo docker compose -f ${DOCKER_COMPOSE} build

logs:
	sudo docker compose -f ${DOCKER_COMPOSE} logs -f

ps:
	sudo docker compose -f ${DOCKER_COMPOSE} ps



clean:
	sudo docker compose -f ${DOCKER_COMPOSE} down -v --rmi all --remove-orphans


fclean: clean
	sudo docker system prune -af
	sudo docker volume prune -f

re: fclean all

.PHONY: all up down stop start restart build logs ps clean fclean re