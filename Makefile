.PHONY: help install mac.install install.after docker.build docker.run docker.push init.envs init.vim init.tmux deploy.bin

.DEFAULT_GOAL := help
DOCKERHUB_NAME := paveg
APP_NAME := dotfiles
VERSION_TAG := latest

help: ## Show options
	@grep -E '^[a-zA-Z_-{\.}]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

install: ## Install dotfiles
	./etc/installer

mac.install: ## Install dotfiles for MacOS
	./etc/darwin_installer

install.after: ## Install after configuration
	./etc/after_install

docker.build: ## Build docker image
	@docker build -t $(APP_NAME):$(VERSION_TAG) .

docker.run: ## Run on docker
	@docker run -it --rm $(APP_NAME):$(VERSION_TAG) zsh

docker.push: ## Push docker image
	@echo "push to $(DOCKERHUB_NAME)/$(APP_NAME):$(VERSION_TAG)"
	@docker tag $(APP_NAME):$(VERSION_TAG) $(DOCKERHUB_NAME)/$(APP_NAME):$(VERSION_TAG)
	@docker push  $(DOCKERHUB_NAME)/$(APP_NAME)

init.envs: ## Install anyenvs, please execute after `anyenv install --init`
	@for ev in rbenv goenv nodenv pyenv sbtenv scalaenv tfenv; do\
		echo -ne '\n' | anyenv install $$ev;\
	done;\
	echo "installation completed anyenvs!"

init.vim: ## Initialize vim configration
	./etc/initvim

init.tmux: ## Initialize tmux configration
	./etc/inittmux

deploy.bin: ## Deploy binaries
	./etc/bdeploy
