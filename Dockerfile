FROM ubuntu:latest

# Update and install packages
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y \
	curl \
	wget \
	vim \
	git \
	g++ \
	clang \
	gcc \
	make \
	pipx \
	python3 \
	python3-pip \
	libreadline-dev \
	openssh-server

# Generate SSH keys
RUN mkdir /var/run/sshd && \
	ssh-keygen -A

# SSH settings
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
	sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Install Norminette
RUN pipx install --force norminette

# Main working directory
RUN mkdir /app

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose SSH port
EXPOSE 22

CMD ["/start.sh"]
