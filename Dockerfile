FROM ubuntu:14.04
MAINTAINER Twine

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
RUN pip install awscli
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.3/install.sh | bash && . ~/.nvm/nvm.sh && nvm install 4.4.7 && nvm use 4.4.7 && nvm alias default 4.4.7
