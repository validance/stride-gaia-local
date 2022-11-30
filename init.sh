#! /bin/bash

# common setup 
GAIAD_HOME=$HOME/.gaia
GAIAD_MONIKER=local_gaia
GAIAD_CHAINID=cosmoshub
KEYRING=test

STRIDED_HOME=$HOME/.stride
STRIDED_MONIKER=local_stride
STRIDED_CHAINID=stride
KEYRING=test

GAIA_MNEMONIC="citizen delay spoon slender reward bottom reveal champion machine congress convince ridge practice table solid now snake pepper debris barrel crime salon course pottery"
STRIDE_MNEMONIC="input oppose mango skate drink damage web skirt document guess abandon grace pet portion salt park erosion expand result day vault into only picture"

# gaiad setup
gaiad init $GAIAD_MONIKER --chain-id $GAIAD_CHAINID
gaiad config keyring-backend $KEYRING
gaiad config broadcast-mode block

echo $GAIA_MNEMONIC | gaiad keys add genesis --recover
gaiad add-genesis-account $(gaiad keys show genesis -a) 1000000000000uatom

gaiad gentx genesis 100000000uatom --chain-id $GAIAD_CHAINID
gaiad collect-gentxs

cat $GAIAD_HOME/config/genesis.json | jq '.app_state["staking"]["params"]["bond_denom"]="uatom"' > $GAIAD_HOME/config/tmp_genesis.json && mv $GAIAD_HOME/config/tmp_genesis.json $GAIAD_HOME/config/genesis.json
cat $GAIAD_HOME/config/genesis.json | jq '.app_state["staking"]["params"]["max_entries"]="10"' > $GAIAD_HOME/config/tmp_genesis.json && mv $GAIAD_HOME/config/tmp_genesis.json $GAIAD_HOME/config/genesis.json

cat $GAIAD_HOME/config/genesis.json | jq '.app_state["mint"]["params"]["mint_denom"]="uatom"' > $GAIAD_HOME/config/tmp_genesis.json && mv $GAIAD_HOME/config/tmp_genesis.json $GAIAD_HOME/config/genesis.json

cat $GAIAD_HOME/config/genesis.json | jq '.app_state["crisis"]["constant_fee"]["denom"]="uatom"' > $GAIAD_HOME/config/tmp_genesis.json && mv $GAIAD_HOME/config/tmp_genesis.json $GAIAD_HOME/config/genesis.json

cat $GAIAD_HOME/config/genesis.json | jq '.app_state["gov"]["voting_params"]["voting_period"]="120s"' > $GAIAD_HOME/config/tmp_genesis.json && mv $GAIAD_HOME/config/tmp_genesis.json $GAIAD_HOME/config/genesis.json
cat $GAIAD_HOME/config/genesis.json | jq '.app_state["gov"]["deposit_params"]["min_deposit"][0]["denom"]="uatom"' > $GAIAD_HOME/config/tmp_genesis.json && mv $GAIAD_HOME/config/tmp_genesis.json $GAIAD_HOME/config/genesis.json
cat $GAIAD_HOME/config/genesis.json | jq '.app_state["gov"]["deposit_params"]["min_deposit"][0]["denom"]="uatom"' > $GAIAD_HOME/config/tmp_genesis.json && mv $GAIAD_HOME/config/tmp_genesis.json $GAIAD_HOME/config/genesis.json
cat $GAIAD_HOME/config/genesis.json | jq '.app_state["interchainaccounts"]["host_genesis_state"]["params"]["allow_messages"]=["/cosmos.authz.v1beta1.MsgExec","/cosmos.authz.v1beta1.MsgGrant","/cosmos.authz.v1beta1.MsgRevoke","/cosmos.bank.v1beta1.MsgSend","/cosmos.bank.v1beta1.MsgMultiSend","/cosmos.distribution.v1beta1.MsgSetWithdrawAddress","/cosmos.distribution.v1beta1.MsgWithdrawValidatorCommission","/cosmos.distribution.v1beta1.MsgFundCommunityPool","/cosmos.distribution.v1beta1.MsgWithdrawDelegatorReward","/cosmos.feegrant.v1beta1.MsgGrantAllowance","/cosmos.feegrant.v1beta1.MsgRevokeAllowance","/cosmos.gov.v1beta1.MsgVoteWeighted","/cosmos.gov.v1beta1.MsgSubmitProposal","/cosmos.gov.v1beta1.MsgDeposit","/cosmos.gov.v1beta1.MsgVote","/cosmos.staking.v1beta1.MsgEditValidator","/cosmos.staking.v1beta1.MsgDelegate","/cosmos.staking.v1beta1.MsgUndelegate","/cosmos.staking.v1beta1.MsgBeginRedelegate","/cosmos.staking.v1beta1.MsgCreateValidator","/cosmos.vesting.v1beta1.MsgCreateVestingAccount","/ibc.applications.transfer.v1.MsgTransfer","/tendermint.liquidity.v1beta1.MsgCreatePool","/tendermint.liquidity.v1beta1.MsgSwapWithinBatch","/tendermint.liquidity.v1beta1.MsgDepositWithinBatch","/tendermint.liquidity.v1beta1.MsgWithdrawWithinBatch"]' > $GAIAD_HOME/config/tmp_genesis.json && mv $GAIAD_HOME/config/tmp_genesis.json $GAIAD_HOME/config/genesis.json


strided init $STRIDED_MONIKER --chain-id $STRIDED_CHAINID
strided config keyring-backend $KEYRING
strided config broadcast-mode block

echo $STRIDE_MNEMONIC | strided keys add genesis --recover 
strided add-genesis-account $(strided keys show genesis -a) 1000000000000ustrd

strided gentx genesis 100000000ustrd --chain-id $STRIDED_CHAINID
strided collect-gentxs

cat $STRIDED_HOME/config/genesis.json | jq '.app_state["staking"]["params"]["bond_denom"]="ustrd"' > $STRIDED_HOME/config/tmp_genesis.json && mv $STRIDED_HOME/config/tmp_genesis.json $STRIDED_HOME/config/genesis.json
cat $STRIDED_HOME/config/genesis.json | jq '.app_state["staking"]["params"]["max_entries"]="10"' > $STRIDED_HOME/config/tmp_genesis.json && mv $STRIDED_HOME/config/tmp_genesis.json $STRIDED_HOME/config/genesis.json

cat $STRIDED_HOME/config/genesis.json | jq '.app_state["mint"]["params"]["mint_denom"]="ustrd"' > $STRIDED_HOME/config/tmp_genesis.json && mv $STRIDED_HOME/config/tmp_genesis.json $STRIDED_HOME/config/genesis.json

cat $STRIDED_HOME/config/genesis.json | jq '.app_state["crisis"]["constant_fee"]["denom"]="ustrd"' > $STRIDED_HOME/config/tmp_genesis.json && mv $STRIDED_HOME/config/tmp_genesis.json $STRIDED_HOME/config/genesis.json

cat $STRIDED_HOME/config/genesis.json | jq '.app_state["gov"]["voting_params"]["voting_period"]="120s"' > $STRIDED_HOME/config/tmp_genesis.json && mv $STRIDED_HOME/config/tmp_genesis.json $STRIDED_HOME/config/genesis.json
cat $STRIDED_HOME/config/genesis.json | jq '.app_state["gov"]["deposit_params"]["min_deposit"][0]["denom"]="ustrd"' > $STRIDED_HOME/config/tmp_genesis.json && mv $STRIDED_HOME/config/tmp_genesis.json $STRIDED_HOME/config/genesis.json
cat $STRIDED_HOME/config/genesis.json | jq '.app_state["gov"]["deposit_params"]["min_deposit"][0]["denom"]="ustrd"' > $STRIDED_HOME/config/tmp_genesis.json && mv $STRIDED_HOME/config/tmp_genesis.json $STRIDED_HOME/config/genesis.json