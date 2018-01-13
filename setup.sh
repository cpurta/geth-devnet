#!/usr/bin/env bash

mkdir -p /ethereum

geth --datadir /ethereum/data init /ethereum/genesis.json

if [ ! -f /ethereum/.accountpassword ]; then
    echo `date +%s | sha256sum | base64 | head -c 32` > /ethereum/.accountpassword
fi

if [ ! -f ~/.primaryaccount ]; then
    geth --networkid 909090 --password /ethereum/.accountpassword account new > /ethereum/.primaryaccount
fi
