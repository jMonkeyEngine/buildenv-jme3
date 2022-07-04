ARG NAMESPACE=""
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update&&apt-get upgrade -y 

RUN apt-get install -y \
build-essential     \
curl \
sudo \
git \
locales 

RUN apt-get install -y \
nodejs \
npm \
&& apt-get clean 

RUN npm install less -g


RUN localedef -i en_US -f UTF-8 en_US.UTF-8 \
&& useradd -m -u 1000 -g 1000 -s /bin/bash linuxbrew \
&& echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL'  >> /etc/sudoers

USER linuxbrew

RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


ENV HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
ENV HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
ENV HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
ENV MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
ENV INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"

RUN brew install hugo

