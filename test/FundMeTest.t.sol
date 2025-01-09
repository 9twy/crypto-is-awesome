// SPDIX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployeFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundMe;
    address immutable USER=makeAddr("user");

    function setUp() external {
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
    }

    function testMinimumDollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public {
        assertEq(fundMe.i_owner(), msg.sender);
    }

    function testPriceFeedVersionIsAccurate() public {
        assertEq(fundMe.getVersion(), 4);
    }
    function testFundFailsWithoutEnoughETH() public {
        vm.expectRevert(); // next line expected to revert
        // assert(This tx fails/reverts);
        fundMe.fund(); // sending 0 ETH 

        
     } 
     function testFundUpdatesFundedDataStructure() public {
        vm.prank(USER); // the next TX will be sent by the USER
        


        fundMe.fund{value: 10e18}();
        uint256 amountFunded = fundMe.addressToAmountFunded(address(this));
        assertEq(amountFunded, 10e18);
}

}
