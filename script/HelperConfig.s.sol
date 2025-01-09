// SPDIX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {Script} from "forge-std/Script.sol";


contract HelperConfig is Script{
    struct NetwoekConfig{
        address priceFeed;
        }
    NetwoekConfig public activeNetworkConfig;

    constructor (){
        if (block.chainid==11155111){
            activeNetworkConfig=getSepoliaEthConfig();

        } else if (block.chainid==1){
            activeNetworkConfig=getMainnetEthConfig();
        }
        else {
            activeNetworkConfig=getAnvilEthConfig();
        }
    } 
        
    function getSepoliaEthConfig() public pure returns(NetwoekConfig memory){
        // price feed address 
        NetwoekConfig memory sepoliaNetworkConfig= NetwoekConfig({priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306});
        return sepoliaNetworkConfig;
        }
        function getMainnetEthConfig() public pure returns(NetwoekConfig memory){
        // price feed address 
        NetwoekConfig memory ethConfig= NetwoekConfig({priceFeed: 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419});
        return ethConfig;
        }

    
    function getAnvilEthConfig() public  returns(NetwoekConfig memory){
        // price feed address 
        // Deploy the mocks
        // return the mock address
        vm.startBroadcast();
        

    }


}