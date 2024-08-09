#!/bin/bash

# Get root password
clear
read -sp "Set root password: " ROOT_PASSWORD
echo

# User and host path
USER_NAME=$(whoami)
HOME_DIR=$(eval echo ~$USER_NAME)
HOST_PATH="${HOME_DIR}/Desktop/ubuntu-linux"

# Set permissions
chmod -R 777 /goinfre/$USER_NAME

# Set .env file
cat <<EOF > .env
ROOT_PASSWORD=${ROOT_PASSWORD}
HOST_PATH=${HOST_PATH}
CONTAINER_PATH=/app
EOF

# Move Docker.app to goinfre
if [ ! -d "/goinfre/$USER_NAME/Docker.app" ]; then
	cp -R /Applications/Docker.app /goinfre/$USER_NAME/
fi

# Required directories
mkdir -p ~/goinfre/docker
mkdir -p ~/goinfre/DockerDesktop
mkdir -p ~/goinfre/Containers
mkdir -p ${HOST_PATH}

# Clear Docker files and hosts
rm -rf ~/Library/Caches/*
rm -rf ~/.docker
rm -rf ~/Library/Containers/com.docker.docker
rm -rf ~/.ssh/known_hosts

# Bind Docker files
cd ~/Library/Containers && ln -s ~/goinfre/Containers com.docker.docker
cd ~/Library/Caches && ln -s ~/goinfre/DockerDesktop com.docker.docker
cd ~ && ln -s ~/goinfre/docker .docker

# Start Docker.app
open /goinfre/$USER_NAME/Docker.app
TEMPVAR=0
while ! docker info &> /dev/null; do
	if [ $TEMPVAR -eq 0 ]; then
		echo "Waiting for Docker to start..."
	fi
	TEMPVAR=$((TEMPVAR+1))
	sleep 3
	if [ $TEMPVAR -eq 20 ]; then
		echo "Docker failed to start. Exiting..."
		exit 1
	fi
done

echo ".env file has been updated."
