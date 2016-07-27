FROM ubuntu:14.04
MAINTAINER Twine

RUN apt-get update -qq
RUN apt-get install -qq libssl-dev libfontconfig build-essential wget git-core python-pip jq curl
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
RUN . ~/.nvm/nvm.sh && nvm install 4.4.7 && nvm use 4.4.7 && nvm alias default node
RUN pip install awscli
