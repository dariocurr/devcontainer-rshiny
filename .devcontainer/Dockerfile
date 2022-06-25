# for format details, see https://docs.docker.com/engine/reference/builder/

ARG VARIANT="latest"

# select image
FROM rocker/shiny:${VARIANT}
LABEL author="dariocurr@gmail.com" maintainer="dariocurr@gmail.com" version="0.0.1"

# read and create user
ARG USER
RUN groupadd --gid 1000 ${USER} \
	&& useradd --uid 1000 --gid 1000 -m ${USER} \
	&& apt -qq update \
	&& apt -qq upgrade -y \
	&& apt -qq install -y sudo \
	&& echo ${USER} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USER} \
	&& chmod 0440 /etc/sudoers.d/${USER}

# install git and other useful packages
RUN apt -qq install git libudunits2-dev libgdal-dev libssl-dev xdg-utils zsh -y

# install R packages
COPY ./requirements*.txt /tmp/r-tmp/
COPY ./.devcontainer/requirements.sh /tmp/r-tmp/
RUN Rscript -e "install.packages('devtools', quiet=TRUE)" \
	&& sudo sh ./tmp/r-tmp/requirements.sh \
	&& sudo rm -rf /tmp/r-tmp/

# change user
USER ${USER}

# add zsh configuration and replace oh-my-zsh with antigen
WORKDIR /home/${USER}/
RUN git clone -q https://github.com/zsh-users/antigen.git .antigen;
ADD --chown=${USER} https://gist.githubusercontent.com/dariocurr/9792ae1fb6ddf736d8fea9e20eb13e26/raw/ .zshrc