pre-requisite: Download the stride binary from github repo(https://github.com/Stride-Labs/stride), add admin address to stride daemon utils/admins.go

https://github.com/Stride-Labs/stride/blob/main/utils/admins.go

```go
package utils

var Admins = map[string]bool{
	"stride1k8c2m5cn322akk5wy8lpt87dd2f4yh9azg7jlh": true, // F5
	"stride10d07y265gmmuvt4z0w9aw880jnsr700jefnezl": true, // gov module
	"stride1sy4vkp007vlmp2t670ev60ky2v0mdcqne8jdjs": true, // for local test <==== this line
}
```
then build gaiad(https://github.com/cosmos/gaia) and strided 

* Tested on stride v3.0.0, gaia v7.0.3

1. Run init.sh


2. Replace stride_epoch value to 30s which is in ~/.stride/config/genesis.json (#121)
```shell
"identifier": "stride_epoch",
"start_time": "0001-01-01T00:00:00Z",
"duration": "30s",
```
3. Open a terminal session, run gaiad.sh
4. Open a new terminal session, run strided.sh
5. Run hermes.sh
6. Run hermes relayer with config.toml in this directory
7. Run transfer.sh
8. Copy ibc denom of uatom i.g) ibc/27394FB092D2ECCD56123C74F36E4C1F926001CEADA9CA97EA622B25F41E5EB2
9. Send uatom to gaia ica host account
```shell
gaiad tx bank send genesis cosmos194dreqzzp6y2tfnuzvw6wzsxk48hlgh8zlgzpdmsnm7gzsv64jeqafz6pp 100uatom --from genesis --node http://localhost:26657 --chain-id cosmoshub
```
10. Register host zone for gaia
```shell
strided tx stakeibc register-host-zone connection-0 uatom cosmos ibc/27394FB092D2ECCD56123C74F36E4C1F926001CEADA9CA97EA622B25F41E5EB2 channel-0 1 --from genesis --chain-id stride --gas auto -b block --node http://localhost:36657
```
11. Check the icq response message from strided
```shell
2:12AM INF Proof validated! module: interchainquery, queryId 01173ff5167296eb4ba7c4c3d896f8b3e273a74210b91b82eb3f8b5e8a512747 module=x/interchainquery
2:12AM INF [ICQ Resp] query 01173ff5167296eb4ba7c4c3d896f8b3e273a74210b91b82eb3f8b5e8a512747 with ttl: 1670001180949678000, resp time: 1670001168896629000. module=x/interchainquery
2:12AM INF [ICQ Resp] executing callback for queryId (01173ff5167296eb4ba7c4c3d896f8b3e273a74210b91b82eb3f8b5e8a512747), module (stakeibc) module=x/interchainquery
```
12. Clean up chain data
```shell
sudo rm -r ~/.gaia
sudo rm -r ~/.stride
```