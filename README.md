# geth-devnet

This is simple repo to create a geth node running private development network to
be used for testing dApps. This holds all the needed code and Dockerfile(s) to
create the base image.

This will by default create a geth node that has an account unlocked, is mining and
has the jsonrpc api enabled, should not be discoverable by other nodes, and has a
high `targetgaslimit`. This allows for contracts that have high gas prices to still
be run by the network.

## Building

To build the image just run the following command:
```
$ docker build -f Dockerfile -t=geth-devnet
```

## Running

Once you have built the image you should be able to run the image by using:
```
$ docker run -d -p 8545:8545 geth-devnet
```

You can add any other geth flags that you need by appending them as a part of the
docker run command.

## LICENSE
MIT
