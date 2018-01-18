FROM ubuntu:xenial
MAINTAINER Chris Purta <cpurta@gmail.com>

RUN apt-get update && \
    apt-get -y -qq upgrade && \
    apt-get -y -qq install software-properties-common && \
    add-apt-repository ppa:ethereum/ethereum && \
    apt-get update && \
    apt-get -y -qq install geth solc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /ethereum/data

ADD . /ethereum/

EXPOSE 8545 8555 8080 6060

WORKDIR /ethereum

CMD ./start-node.sh
