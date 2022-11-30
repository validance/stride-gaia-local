#! /bin/bash

gaiad tx ibc-transfer transfer transfer channel-0 stride1sy4vkp007vlmp2t670ev60ky2v0mdcqne8jdjs 1uatom --node "http://localhost:26657" --from genesis --chain-id cosmoshub -b block
sleep 10
strided query bank balances stride1sy4vkp007vlmp2t670ev60ky2v0mdcqne8jdjs --node http://localhost:36657