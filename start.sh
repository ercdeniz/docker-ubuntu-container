#!/bin/bash

# Set root password
echo "root:${ROOT_PASSWORD}" | chpasswd

# Start SSH
/usr/sbin/sshd -D
