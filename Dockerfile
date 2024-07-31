FROM ubuntu:latest

# Update and install packages
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y \
	curl \
	wget \
	vim \
	git \
	clang \
	gcc \
	make \
	openssh-server

# Generate SSH keys
RUN mkdir /var/run/sshd && \
	ssh-keygen -A

# SSH settings
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
	sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Main working directory
RUN mkdir /app

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose SSH port
EXPOSE 22

CMD ["/start.sh"]
