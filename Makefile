- include .env
build:; forge build
deploy-sepolia :
forge script scripts/DeployFundMe --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --verify
etherscan-api-key $(ETHERSCAN_API_KEY)
