# -*- coding: utf-8 -*-

CMD_DOCKER := docker
CMD_DOCKER_COMPOSE := docker-compose
CONTAINER_NUXT := nuxt

.PHONY: ps up shell log build start lint test generate deploy clean clean prune

ps:
	$(CMD_DOCKER_COMPOSE) ps

up:
	$(CMD_DOCKER_COMPOSE) up -d --remove-orphans

shell: up
	$(CMD_DOCKER_COMPOSE) exec $(CONTAINER_NUXT) /bin/ash

logs: up
	$(CMD_DOCKER_COMPOSE) logs --timestamp

build: up
	$(CMD_DOCKER_COMPOSE) exec $(CONTAINER_NUXT) npm run build

start: build
	$(CMD_DOCKER_COMPOSE) exec -d $(CONTAINER_NUXT) npm run start

lint: up
	$(CMD_DOCKER_COMPOSE) exec $(CONTAINER_NUXT) npm run lint

test: up
	$(CMD_DOCKER_COMPOSE) exec $(CONTAINER_NUXT) npm run test

generate: up
	$(CMD_DOCKER_COMPOSE) exec $(CONTAINER_NUXT) npm run generate

deploy: generate
	echo "TODO: Not Implemented Yet!"

down:
	$(CMD_DOCKER_COMPOSE) down --rmi all --remove-orphans

clean: down
	rm -rf dist && rm -rf node_modules

prune: down
	$(CMD_DOCKER) system prune --all --force --volumes
