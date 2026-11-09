COMPOSE ?= docker compose
APP ?= web
.DEFAULT_GOAL := help
.PHONY: help build up down stop restart logs ps shell console setup migrate test

help:
	@echo "Targets: build up down stop restart logs ps shell console setup migrate test"
	@echo "Start: make build && make up (http://localhost:3000)"

build:
	$(COMPOSE) build

up:
	$(COMPOSE) up

down:
	$(COMPOSE) down

stop:
	$(COMPOSE) stop

restart:
	$(COMPOSE) restart

logs:
	$(COMPOSE) logs -f

ps:
	$(COMPOSE) ps

shell:
	$(COMPOSE) exec $(APP) bash

console:
	$(COMPOSE) exec $(APP) bin/rails console

setup:
	$(COMPOSE) run --rm $(APP) bin/rails db:prepare

migrate:
	$(COMPOSE) run --rm $(APP) bin/rails db:migrate

test:
	$(COMPOSE) run --rm -e RAILS_ENV=test $(APP) sh -c "bin/rails db:prepare && bin/rails test"
