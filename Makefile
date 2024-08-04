IMAGE_NAME := ubuntu_image
CONTAINER_NAME := ubuntu
HOST_PATH := $(HOME)/Desktop/ubuntu-linux
CONTAINER_PATH := /app

all: setup build up help

setup:
	@chmod +x setup.sh
	@bash setup.sh

build:
	@docker build -t $(IMAGE_NAME) .

up:
	@docker-compose up -d

down:
	@docker-compose down

re:
	@docker-compose down
	@docker-compose up --build -d

clean:
	@docker rmi $(IMAGE_NAME)

prune:
	@echo "ROOT_PASSWORD=\nHOST_PATH=\nCONTAINER_PATH=" > .env
	@docker system prune -a -f

fclean: down clean prune

close:
	@pkill Docker

exec:
	@docker exec -it $(CONTAINER_NAME) bash

logs:
	@docker logs -f $(CONTAINER_NAME)

status:
	@docker ps -a

help:
	@echo "Usage: make [target]"
	@echo "  make             # Setup, build and start the container"
	@echo "  make setup       # Setup the project"
	@echo "  make build       # Build the Docker image"
	@echo "  make up          # Start the container"
	@echo "  make down        # Stop and remove the container"
	@echo "  make re          # Restart the container"
	@echo "  make clean       # Remove the Docker image"
	@echo "  make prune       # Remove all stopped containers, unused images and networks"
	@echo "  make fclean      # Down, clean and prune"
	@echo "  make close       # Close the Docker daemon"
	@echo "  make exec        # Execute a command inside the running container"
	@echo "  make logs        # Display logs of the running container"
	@echo "  make status      # Display status of all containers"
	@echo "  make help        # Display this help message"
