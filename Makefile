ENV_FILE = .env
STACK = $(shell find . -name compose.yaml -exec dirname {} \; | sed 's|^\./||')

# Default target
help:
	@echo -e "Usage:"
	@echo -e "\tmake <stack>/up"
	@echo -e "\tmake <stack>/down"
	@echo -e "\nAvailable stacks:"
	@echo "$(STACK)" | tr ' ' '\n'

# Dynamic targets
%/up:
	docker compose --env-file $(ENV_FILE) -f $*/compose.yaml up -d --force-recreate
%/down:
	docker compose --env-file $(ENV_FILE) -f $*/compose.yaml down -v


.PHONY: help %/up %/down

