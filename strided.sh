#! /bin/bash

strided start --p2p.laddr tcp://127.0.0.1:36656 --rpc.laddr tcp://127.0.0.1:36657 --rpc.pprof_laddr tcp://127.0.0.1:7060 --grpc.address 0.0.0.0:10090 --grpc-web.address 0.0.0.0:10091