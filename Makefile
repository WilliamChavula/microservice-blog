.PHONY: all down migrate-auth test-auth

all:
	docker compose up --build

down:
	docker compose down -v

migrate-auth:
	cd auth-api && \
	FILES=$$(find migrations -maxdepth 1 -type f | wc -l) && \
    echo "Generating database migrations" && \
    docker compose exec auth-api-img pnpm exec drizzle-kit generate && \
    [ "$$FILES" -lt "$$(find migrations -maxdepth 1 -type f | wc -l)" ] && \
    echo "Migrating database" && \
    docker compose exec auth-api-img pnpm exec drizzle-kit migrate && \
	docker compose exec auth-api-img sh -c "export NODE_ENV=test; pnpm exec drizzle-kit migrate"

test-auth:
	cd auth-api && \
	docker compose exec auth-api-img pnpm test