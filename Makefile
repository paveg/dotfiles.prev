.PHONY: help install

.DEFAULT_GOAL := help

help: ## Show options
	@grep -E '^[a-zA-Z_-{\.}]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

install: ## Install dotfiles
	curl -L raw.github.com/paveg/dotfiles/master/install.sh | bash
