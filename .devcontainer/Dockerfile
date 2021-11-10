# select image
ARG SHINY_VERSION="latest"
FROM rocker/shiny:${SHINY_VERSION}
LABEL author="dariocurr@gmail.com" maintainer="dariocurr@gmail.com" version="0.0.1"

# create vscode user
RUN groupadd --gid 1000 vscode \
	&& useradd --uid 1000 --gid 1000 -m vscode \
	&& apt-get update \
	&& apt upgrade -y \
	&& apt-get install -y sudo \
	&& echo vscode ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/vscode \
	&& chmod 0440 /etc/sudoers.d/vscode

# install git
RUN apt install git zsh -y

# install R packages
COPY requirements*.txt tmp/r-tmp/
COPY .devcontainer/requirements.sh tmp/r-tmp/
RUN Rscript -e "install.packages('devtools')" \
	&& .tmp/r-tmp/requirements.sh \
	&& rm -rf tmp/r-tmp/

# install ohmyzsh
USER vscode
RUN sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY .devcontainer/.zshrc .