#! /bin/bash

hermes keys add --chain cosmoshub --key-file ./gaia_genesis_key.json
hermes keys add --chain stride --key-file ./stride_genesis_key.json

hermes create channel --a-chain stride --b-chain cosmoshub --a-port transfer --b-port transfer --new-client-connection