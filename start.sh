#!/bin/bash

# Norminette setup
pipx ensurepath && source ~/.bashrc

# Set root password
echo "root:${ROOT_PASSWORD}" | chpasswd

# Start SSH
/usr/sbin/sshd -D
