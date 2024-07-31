# Makefile

# Variables
IMAGE_NAME := ubuntu_image
CONTAINER_NAME := ubuntu
HOST_PATH := $(HOME)/Desktop/ubuntu-linux
CONTAINER_PATH := /app

all: setup build up

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
	@docker system prune -f

exec:
	@docker exec -it $(CONTAINER_NAME) sh

logs:
	@docker logs -f $(CONTAINER_NAME)

status:
	@docker ps -a

help:
	@echo "Usage:"
	@echo "  make             # Setup, build and start the container"
	@echo "  make setup       # Setup the project"
	@echo "  make build       # Build the Docker image"
	@echo "  make up          # Start the container"
	@echo "  make down        # Stop and remove the container"
	@echo "  make re          # Restart the container"
	@echo "  make clean       # Remove the Docker image"
	@echo "  make prune       # Remove all stopped containers and unused images"
	@echo "  make exec        # Execute a command inside the running container"
	@echo "  make logs        # Display logs of the running container"
	@echo "  make status      # Display status of all containers"
	@echo "  make help        # Display this help message"
