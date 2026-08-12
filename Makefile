#
# Task runner for this project's development lifecycle. Each target wraps a
# same-named script in `run/`.
#

.DEFAULT_GOAL := help

version: ## Tag a release point
	./run/version

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: version help
