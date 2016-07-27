FROM ubuntu:14.04
MAINTAINER Twine

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Set debconf to run non-interactively
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install base dependencies
RUN apt-get update && apt-get install -y \
    libssl-dev \
    libfontconfig \
    build-essential \
    wget \
    git-core \
    python-pip \
    jq \
    curl \
&& rm -rf /var/lib/apt/lists/*

# Install aws cli
RUN pip install awscli

ENV NVM_DIR /usr/local/nvm
ENV NVM_VERSION 0.31.3
ENV NODE_VERSION 4.4.7

# Install nvm with node and npm
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH
