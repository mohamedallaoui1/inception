all: up

up:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean:
	@docker compose -f ./srcs/docker-compose.yml down --rmi all

fclean: clean
	@docker system prune -af
	@docker volume prune -f
	@docker network prune -f
	@sudo rm -rf ~/data/wordpress/* && sudo rm -rf ~/data/mariadb/*
re: fclean all

.PHONY: all down clean re