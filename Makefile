DC := docker-compose -f srcs/docker-compose.yml
DB_PATH = $(realpath .)/data

all:	set_path
	@mkdir -p $(DB_PATH)
	@mkdir -p $(DB_PATH)/wordpress
	@mkdir -p $(DB_PATH)/mariadb
	@$(DC) up -d --build

down:
	@$(DC) down

clean: down
	@docker volume rm $(shell docker volume ls -q) || true
	@docker network prune --force || true

set_path:
	@sed -i '/^DB_PATH=/c\DB_PATH=$(DB_PATH)' ./srcs/.env

re: down all

.PHONY: all down re
