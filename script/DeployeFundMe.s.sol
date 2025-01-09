// MIT-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external  returns (FundMe){
        // any thing that is before the startBroadcast will not consider a tx
        HelperConfig helperConfig= new HelperConfig();
        address ethUsdPriceFeed=helperConfig.activeNetworkConfig();
        // real tx is after startbroad line
        vm.startBroadcast();
        FundMe fundMe= new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
