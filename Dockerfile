FROM ethereum/client-go:v1.7.3
MAINTAINER Chris Purta <cpurta@gmail.com>

RUN apk update && \
    apk add bash curl

RUN mkdir -p /ethereum/data

ADD . /ethereum/

EXPOSE 8545 8555 8080 6060

WORKDIR /ethereum

ENTRYPOINT ["./start-node.sh"]
