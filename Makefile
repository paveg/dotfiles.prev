.PHONY: help install docker.base.build docker.base.push

DOCKER_HUB_NAME := paveg
VERSION_TAG := latest
BASE_NAME := dot-ubuntu-base
APP_NAME := dot-ubuntu
BASE_IMAGE_NAME := $(DOCKER_HUB_NAME)/$(BASE_NAME)
IMAGE_NAME := $(DOCKER_HUB_NAME)/$(APP_NAME)
.DEFAULT_GOAL := help

help: ## Show options
	@grep -E '^[a-zA-Z_-{\.}]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

install: ## Install dotfiles
	curl -L raw.github.com/paveg/dotfiles/master/install.sh | bash

docker.build: ## Build docker image
	@docker build -t $(IMAGE_NAME) .

docker.base.build: ## Build base docker image
	@docker build -f ./docker/base/Dockerfile --build-arg USERNAME=dev -t $(BASE_IMAGE_NAME) .

docker.base.push: ## Push base docker image
	@echo "push to $(BASE_IMAGE_NAME):$(VERSION_TAG)"
	@docker push $(BASE_IMAGE_NAME):$(VERSION_TAG)

