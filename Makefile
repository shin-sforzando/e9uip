# -*- coding: utf-8 -*-

CMD_DOCKER := docker
CMD_DOCKER_COMPOSE := docker-compose
CONTAINER_NUXT := nuxt

.PHONY: ps up shell log build start lint test generate deploy clean clean prune

ps:
	$(CMD_DOCKER_COMPOSE) ps

up:
	$(CMD_DOCKER_COMPOSE) up ${ARGS} --detach --remove-orphans

shell: up
	$(CMD_DOCKER_COMPOSE) exec ${ARGS} $(CONTAINER_NUXT) /bin/ash

logs:
	$(CMD_DOCKER_COMPOSE) logs ${ARGS} --timestamp

build: up
	$(CMD_DOCKER_COMPOSE) exec ${ARGS} $(CONTAINER_NUXT) yarn build

start: build
	$(CMD_DOCKER_COMPOSE) exec ${ARGS} --detach $(CONTAINER_NUXT) yarn start

lint: up
	$(CMD_DOCKER_COMPOSE) exec ${ARGS} $(CONTAINER_NUXT) yarn lint

test: up
	$(CMD_DOCKER_COMPOSE) exec ${ARGS} $(CONTAINER_NUXT) yarn test

generate: up
	$(CMD_DOCKER_COMPOSE) exec ${ARGS} $(CONTAINER_NUXT) yarn generate

deploy: generate
	echo "TODO: Not Implemented Yet!"

down:
	$(CMD_DOCKER_COMPOSE) down ${ARGS} --rmi all --remove-orphans

clean: down
	rm -rf dist && rm -rf node_modules

prune: down
	$(CMD_DOCKER) system prune ${ARGS} --all --force --volumes
