pre-requisite: add admin address to stride daemon utils/admins.go

```go
package utils

var Admins = map[string]bool{
	"stride1k8c2m5cn322akk5wy8lpt87dd2f4yh9azg7jlh": true, // F5
	"stride10d07y265gmmuvt4z0w9aw880jnsr700jefnezl": true, // gov module
	"stride1sy4vkp007vlmp2t670ev60ky2v0mdcqne8jdjs": true, // for local test <==== this line
}
```
then build gaiad and strided 

1. run init.sh
2. replace stride_epoch value to 30s which is in ~/.stride/config/genesis.json (#121)
```shell
"identifier": "stride_epoch",
"start_time": "0001-01-01T00:00:00Z",
"duration": "30s",
```
3. open a terminal session, run gaiad.sh 
4. open a new terminal session, run strided.sh
5. run hermes.sh
6. run hermes relayer with config.toml in this directory
7. run transfer.sh
8. copy ibc denom of uatom i.g) ibc/27394FB092D2ECCD56123C74F36E4C1F926001CEADA9CA97EA622B25F41E5EB2
   strided tx stakeibc register-host-zone connection-0 uatom cosmos ibc/27394FB092D2ECCD56123C74F36E4C1F926001CEADA9CA97EA622B25F41E5EB2 channel-0 1 --from genesis --chain-id stride --gas auto -b block --node http://localhost:36657