#!/usr/bin/env bash

# hardcoded address of first account in keystore
ETHERBASE='0x1f7402f55e142820ea3812106d0657103fc1709e'
DATADIR="$HOME/.ethdata"

# Generate and store a wallet password
if [ ! -f $DATADIR ]; then
    echo "Making data directory '$HOME/.ethdata'..."
    mkdir -p $DATADIR
    cp -R ./keystore $DATADIR
fi

# initialize our private network
geth \
--datadir $DATADIR \
--networkid 454545 \
--etherbase $ETHERBASE \
--targetgaslimit '6700000' \
init ./genesis.json

geth \
--rpc \
--rpcaddr '0.0.0.0' \
--rpcport 8545 \
--rpccorsdomain '*' \
--datadir $DATADIR \
--networkid 454545 \
--etherbase $ETHERBASE \
--targetgaslimit '6700000' \
js ./run-dev-node.js
