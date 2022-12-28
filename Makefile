init: create-network docker-down-clear docker-build docker-up

up:  docker-up
down: docker-down rm-network
restart: down up

kill:
	docker kill $(docker ps -aq) && docker rm $(docker ps -aq)

create-network:
	docker network create my_network

rm-network:
	docker network rm my_network

images:
	docker images

prune:
	docker system prune

memory:
	sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"

docker-up:
	docker compose -f docker-compose.yml up

docker-down:
	docker compose -f docker-compose.yml down --remove-orphans

docker-down-clear:
	docker compose -f docker-compose.yml down -v --remove-orphans

docker-build:
	docker compose -f docker-compose.yml build
