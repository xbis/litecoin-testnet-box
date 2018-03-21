# litecoin-testnet-box

Create your own private litecoin testnet

You must have `litecoind` and `litecoin-cli` installed on your system.

## Starting the testnet-box

This will start up two nodes using the two datadirs `1` and `2`. They
will only connect to each other in order to remain an isolated private testnet.
Two nodes are provided, as one is used to generate blocks and it's balance
will be increased as this occurs (imitating a miner). You may want a second node
where this behavior is not observed.

Node `1` will listen on port `19100`, allowing node `2` to connect to it.

Node `1` will listen on port `19101` and node `2` will listen on port `19111` 
for the JSON-RPC server.


```
$ make start
```

## Check the status of the nodes

```
$ make getinfo
litecoin-cli -datadir=1  getinfo
{
  "version": 130200,
  "protocolversion": 70015,
  "walletversion": 130000,
  "balance": 0.00000000,
  "blocks": 0,
  "timeoffset": 0,
  "connections": 0,
  "proxy": "",
  "difficulty": 4.656542373906925e-10,
  "testnet": false,
  "keypoololdest": 1505115081,
  "keypoolsize": 100,
  "paytxfee": 0.00000000,
  "relayfee": 0.00100000,
  "errors": ""
}
litecoin-cli -datadir=2  getinfo
{
  "version": 130200,
  "protocolversion": 70015,
  "walletversion": 130000,
  "balance": 0.00000000,
  "blocks": 0,
  "timeoffset": 0,
  "connections": 0,
  "proxy": "",
  "difficulty": 4.656542373906925e-10,
  "testnet": false,
  "keypoololdest": 1505115081,
  "keypoolsize": 100,
  "paytxfee": 0.00000000,
  "relayfee": 0.00100000,
  "errors": ""
}
```

## Generating blocks

Normally on the live, real, litecoin network, blocks are generated, on average,
every 10 minutes. Since this testnet-in-box uses litecoin Core's (litecoind)
regtest mode, we are able to generate a block on a private network
instantly using a simple command.

To generate a block:

```
$ make generate
```

To generate more than 1 block:

```
$ make generate BLOCKS=10
```

## Need to generate at least 100 blocks before there will be a balance in the first wallet
```
$ make generate BLOCKS=200
```

## Verify that there is a balance on the first wallet
```
$ make getinfo
```

## Generate a wallet address for the second wallet
```
$ make address2
```

## Sending litecoins
To send litecoins that you've generated to the second wallet: (be sure to change the ADDRESS value below to wallet address generated in the prior command)

```
$ make sendfrom1 ADDRESS=mkuYNa49mrrh4JcimJn6wyNWrvzsvWAsyf AMOUNT=10
```

## Does the balance show up?
Run the getinfo command again. Does the balance show up? Why not?
```
$ make getinfo
```

## Generate another block
```
$ make generate
```

## Stopping the testnet-box

```
$ make stop
```

To clean up any files created while running the testnet and restore to the
original state:

```
$ make clean
```
