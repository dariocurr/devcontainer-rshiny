# Load variables
ARG SHINY_VERSION

# Choice image
FROM rocker/shiny:${SHINY_VERSION}

# Create vscode user
RUN useradd -ms /bin/bash vscode

# Update apt
RUN apt update \
	&& apt upgrade -y \
	&& apt install git -y