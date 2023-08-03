# Calculator Solidity App

# About
This is a simple calculator application that can be used to perform simple and moderate arithmetic expressions. This calculator is meant to be deployed on the block chain, and save whatever the user has calculated on the block chain. The calculator works by using a package called `eval-utils-lib`. This package has a function called evaluate, which takes in an arithmetic string, computes it and returns a uint256 as the result. This calculator uses the library to calculate the expression provided by the user.

The gas cost for implementing the operations would definitely defer, depending on the size and length of the string being processed. For large strings, pre-processing is advised, so as to reduce the gas cost. It is advised to be used wisely, preferably on smaller strings.

This app is written with simplicity in mind, and should be easy to use and implement, please feel free to make any request or update for request to me, it's still a work in progress, and this contribution is important to the Web3 Community. Code Away  


# Getting started
clone this project by running this on your terminal
```git
git clone https://github.com/OsoTega/solidity-calculator-app
```
# Prerequisites
You must have foundry installed in your development environment, as this project was written
with foundry. Create a `.env` file in the root of the project. Once foundry is installed, start a local anvil chain, copy one of the address key and paste into you `.env` file as such

```.env
DEFAULT_ANVIL_KEY= <COPIED KEY>
```

next, copy you private key from your development wallet e.g metamask, and paste also to your `.env` file. THE KEY MUST BE FOR A TEST ETH, AND NOT A REAL ONE

```.env
PRIVATE_KEY== <DEVELOPMENT KEY>
```

next, copy the anvil local blockchain url, and paste also to your `.env` file. 

```.env
ANVIL_RPC_URL=http://127.0.0.1:8545
```

if you are using sepolia test net with alchemy, copy the alchemy project url and paste also to your `.env` file. 

```.env
SEPOLIA_RPC_URL=<SEPOLIA ALCHEMY URL>
```

# Working with the Project
## Preparing the project
You need to first of all install the libraries the projects needs to run. Run this in your terminal

```terminal
make install
```

The command would install all the libraries the project needs

## Deploying the project
You can deploy to any blockchain, preferably deploy to the anvil local blockchain. To deploy to the anvil local blockchain, start anvil by running this command on your terminal
```terminal
anvil
```
This command would start the local anvil blockchain. Once it is running, open another terminal and run

```terminal
//by default would deploy to the local anvil blockchain

make deploy

//would deploy to your alchemy sepolia network

make deploy ARGS=\"--network sepolia\""
```

The `make deploy` command would deploy the contract to your local anvil blockchain. The `make deploy ARGS=\"--network sepolia\""` command would deploy the contract to your alchemy sepolia blockchain

## To calculate
Once you've deployed the contract, copy the contract address from anvil, and add it to your environment variables

```.env
CONTRACT_ADDRESS=<CONTRACT ADDRESS>
```

Using the contract is now as easy as just running on your terminal
```terminal
make calculate ARGS="1+1"
```

```terminal
make calculate ARGS="(4+4)/2*4"
```

Viewing the result is as easy as running on your terminal

```terminal
make result
```

The `make` commands are stored in the Makefile in the project. Don't forget to leave a star, and follow for more

## Additional information
If you're deploying to your alchemy sepolia network, you also need to include your `etherscan` api key to your environment variables

```.env
ETHERSCAN_API_KEY=http://127.0.0.1:8545
```

## Requirements
The contract was written using solidity ^0.8.18

