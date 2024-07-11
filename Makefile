DC := docker-compose -f ./srcs/docker-compose.yml

all:
	@mkdir -p /$(HOME)/inception_volumes/wordpress
	@mkdir -p /$(HOME)/inception_volumes/mysql
	@$(DC) up -d --build

down:
	@$(DC) down

re: down all

.PHONY: all down re