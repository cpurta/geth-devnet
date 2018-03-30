# geth-devnet

[![CircleCI](https://circleci.com/gh/cpurta/geth-devnet/tree/master.svg?style=svg)](https://circleci.com/gh/cpurta/geth-devnet/tree/master)

This is simple repo to create a geth node running private development network to
be used for testing dApps. This holds all the needed code and Dockerfile(s) to
create the base image.

This will by default create a geth node that has an account unlocked, is mining and
has the jsonrpc api enabled, should not be discoverable by other nodes, and has a
high `targetgaslimit`. This allows for contracts that have high gas prices to still
be run by the network.

There are two "flavors" of images, one using the geth instant sealing development network
and another using Proof of Authority (PoA) network. The instant sealing network allows
for faster mining times and if you are testing contracts this will usually allow
for your test to be completed faster.

## Building

When building the images, the default will use
a PoA network. In order to use the instant seal dev network you will need to set a
docker argument when building the image.

### Proof of Authority network

To build the image just run the following command:
```
$ docker build --build-arg DEV_CHAIN=false -f Dockerfile -t geth-devnet:<tag_name> .
```

### Instant seal development network

```
$ docker build --build-arg DEV_CHAIN=true -f Dockerfile -t geth-devnet:<tag_name> .
```

## Running

Once you have built the image you should be able to run the image by using:
```
$ docker run -d -p 8545:8545 geth-devnet:<tag_name>
```

You can add any other geth flags that you need by appending them as a part of the
docker run command.

## LICENSE
MIT
