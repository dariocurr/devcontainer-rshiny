# Select image
ARG SHINY_VERSION
FROM rocker/shiny:${SHINY_VERSION}

# Create vscode user
RUN groupadd --gid 1000 vscode \
	&& useradd --uid 1000 --gid 1000 -m vscode \
	&& apt-get update \
	&& apt upgrade -y \
	&& apt-get install -y sudo \
	&& echo vscode ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/vscode \
	&& chmod 0440 /etc/sudoers.d/vscode

# Install git
RUN apt install git -y