.DEFAULT_GOAL := help

define slugify
echo "$(1)" \
	| iconv -f utf-8 -t ascii//TRANSLIT 2>/dev/null \
	| tr '[:upper:]' '[:lower:]' \
	| sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$$//'
endef

.PHONY: new
new: ## Crée un nouvel article
	@read -r -p "Titre de l'article : " title; \
	if [ -z "$$title" ]; then echo "Titre vide, abandon."; exit 1; fi; \
	slug=$$($(call slugify,$$title)); \
	if [ -z "$$slug" ]; then echo "Slug vide après transformation, abandon."; exit 1; fi; \
	if [ -d "content/$$slug" ]; then echo "content/$$slug existe déjà, abandon."; exit 1; fi; \
	esc=$$(printf '%s' "$$title" | sed 's/\\/\\\\/g; s/"/\\"/g'); \
	HUGO_NEWTITLE="$$esc" hugo new content "$$slug/index.md"; \
	echo "Article créé : content/$$slug/index.md (titre : $$title)"

.PHONY: serve
serve: ## Lance le serveur hugo
	@hugo server --renderToMemory --disableFastRender --ignoreCache -D

.PHONY: build
build: ## Génère le site
	@hugo --minify

.PHONY: help
help: ## Affiche cette aide
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'
