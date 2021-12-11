.PHONY: help
help: ## Prints help for targets with comments
	@grep -E '^[/a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build: ## build sprites
	./scripts/google-cloud/download_icons.sh
	./scripts/google-cloud/create_sprite.sh

.PHONY: generate/snippets
generate/snippets: ## generate snippets file
	cd ./tools/snippets-generator && go run . > ${PWD}/snippets/ultisnips/plantuml.snippets
