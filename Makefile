DC := docker-compose -f ./srcs/docker-compose.yml

all:
	@mkdir -p /home/ymamur/my_projects/inception_volumes/wordpress
	@mkdir -p /home/ymamur/my_projects/inception_volumes/mysql
	@$(DC) up -d --build

down:
	@$(DC) down

re: down all

.PHONY: all down re