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

ADD genesis.json /ethereum/genesis.json
ADD setup.sh /ethereum/

EXPOSE 8545 8555 8080 6060

RUN /ethereum/setup.sh

RUN geth version

ENTRYPOINT ["geth", "--rpc", "--rpcaddr", "0.0.0.0", "--rpccorsdomain", "*", "--rpcapi", "db,eth,net,web3,personal,miner", "--networkid", "909090", "--unlock", "0","--password", "/ethereum/.accountpassword", "--mine", "--minerthreads", "1", "--targetgaslimit", "900000000", "--nodiscover"]
