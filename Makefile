all: up

up:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean:
	@docker stop $$(docker ps -a -q)
	@docker rm $$(docker ps -a -q)
	@docker rmi $$(docker images -q)
	@sudo rm -rf ~/data/${USER}/wordpress/*
	@sudo rm -rf ~/data/${USER}/mariadb/*

fclean:
	@docker stop $$(docker ps -a -q)
	@docker rm $$(docker ps -a -q)
	@docker rmi $$(docker images -q)
	@docker system prune -a -f
	@docker network prune -f
	@docker volume prune -f
	@sudo rm -rf ~/data/mallaoui/wordpress/*
	@sudo rm -rf ~/data/mallaoui/mariadb/*

re: down all

.PHONY: all down clean re