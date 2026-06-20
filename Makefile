EXTENSIONS := $(wildcard extensions/*)

.PHONY: install build dev

install:
	@for ext in $(EXTENSIONS); do \
		echo "→ npm install $$ext"; \
		npm install --prefix $$ext; \
	done

build:
	@for ext in $(EXTENSIONS); do \
		echo "→ build $$ext"; \
		npm run build --prefix $$ext; \
	done

dev:
	@if [ -z "$(EXT)" ]; then \
		echo "Usage: make dev EXT=converter"; \
		exit 1; \
	fi
	npm run dev --prefix extensions/$(EXT)
