DOCKER_COMPOSE = srcs/docker-compose.yml

all:
	sudo docker compose -f ${DOCKER_COMPOSE} up -d --build

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