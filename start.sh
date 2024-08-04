#!/bin/bash

# Update .bashrc to change to /app directory
echo 'cd /app' >> /root/.bashrc

# Norminette setup
pipx ensurepath && source ~/.bashrc

# Set root password
echo "root:${ROOT_PASSWORD}" | chpasswd

# Start SSH
/usr/sbin/sshd -D
