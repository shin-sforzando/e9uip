# -*- coding: utf-8 -*-

CMD_DOCKER := docker
CMD_DOCKER_COMPOSE := docker-compose
CONTAINER_NUXT := nuxt

.PHONY: ps up renew open shell log build start lint test generate deploy upgrade-interactive clean clean prune help

ps: ## 監視
	$(CMD_DOCKER_COMPOSE) ps

up: ## 起動
	$(CMD_DOCKER_COMPOSE) up ${ARGS} --detach --remove-orphans
	make logs

renew: down clean up ; ## 更新

open: ## 閲覧
	open http://0.0.0.0:3000/

shell: up ## 接続
	$(CMD_DOCKER_COMPOSE) exec ${ARGS} $(CONTAINER_NUXT) /bin/ash

logs: ## 記録
	$(CMD_DOCKER_COMPOSE) logs ${ARGS} --timestamp

build: up ## 構築
	$(CMD_DOCKER_COMPOSE) exec ${ARGS} $(CONTAINER_NUXT) yarn build

start: build ## 開始
	$(CMD_DOCKER_COMPOSE) exec ${ARGS} --detach $(CONTAINER_NUXT) yarn start

lint: up ## 監査
	$(CMD_DOCKER_COMPOSE) exec ${ARGS} $(CONTAINER_NUXT) yarn lint

test: up ## 試験
	$(CMD_DOCKER_COMPOSE) exec ${ARGS} $(CONTAINER_NUXT) yarn test

generate: up ## 生成
	$(CMD_DOCKER_COMPOSE) exec ${ARGS} $(CONTAINER_NUXT) yarn generate

deploy: generate ## 配備
	echo "TODO: Not Implemented Yet!"

upgrade-interactive: ## 解決
	yarn upgrade-interactive

down: ## 停止
	$(CMD_DOCKER_COMPOSE) down ${ARGS} --rmi all --remove-orphans

clean: down ## 掃除
	rm -rf dist && rm -rf node_modules

prune: down ## 破滅
	$(CMD_DOCKER) system prune ${ARGS} --all --force --volumes

help: ## 助言
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
