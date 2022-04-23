# for format details, see https://docs.docker.com/engine/reference/builder/

# select image
ARG SHINY_VERSION="latest"
FROM rocker/shiny:${SHINY_VERSION}
LABEL author="dariocurr@gmail.com" maintainer="dariocurr@gmail.com" version="0.0.1"

# create vscode user
RUN groupadd --gid 1000 vscode \
	&& useradd --uid 1000 --gid 1000 -m vscode \
	&& apt -qq update \
	&& apt -qq upgrade -y \
	&& apt -qq install -y sudo \
	&& echo vscode ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/vscode \
	&& chmod 0440 /etc/sudoers.d/vscode

# install git and other useful packages
RUN apt -qq install git libudunits2-dev libgdal-dev libssl-dev xdg-utils zsh -y

# install R packages
COPY requirements*.txt /tmp/r-tmp/
COPY .devcontainer/requirements.sh /tmp/r-tmp/
RUN Rscript -e "install.packages('devtools', quiet=TRUE)" \
	&& sudo sh ./tmp/r-tmp/requirements.sh \
	&& sudo rm -rf /tmp/r-tmp/

# install zsh
USER vscode
WORKDIR /home/vscode/
RUN sudo apt -qq install zsh -y \
	&& git clone -q git@github.com:zsh-users/antigen.git .antigen
ADD --chown=vscode https://gist.githubusercontent.com/dariocurr/9792ae1fb6ddf736d8fea9e20eb13e26/raw/ .zshrc