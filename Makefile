init: docker-down-clear \
	docker-build docker-up \

up: docker-up
down: docker-down
restart: down up

docker-create-network:
	docker network create my_network

docker-rm-network:
	docker network rm my_network

images:
	docker images

prune:
	docker system prune

memory:
	sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"

docker-up:
	docker compose -f docker-compose.dev.yml up

docker-down:
	docker compose -f docker-compose.dev.yml down --remove-orphans
	docker-rm-network

docker-down-clear:
	docker compose down -v --remove-orphans

docker-build:
	docker-create-network
	docker compose -f docker-compose.yml build
