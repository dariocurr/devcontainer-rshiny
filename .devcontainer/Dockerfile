# select image
ARG SHINY_VERSION
FROM rocker/shiny:${SHINY_VERSION}

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

# install ohmyzsh
USER vscode
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY .devcontainer/.zshrc .

# install R packages
COPY requirements*.txt /tmp/r-tmp/
# RUN while IFS=" " read -r package version; \
# 	do \
# 	Rscript -e "devtools::install_version('"$package"', version='"$version"')"; \
# 	done < "/tmp/r-tmp/requirements.txt" \
# 	&& rm -rf /tmp/r-tmp