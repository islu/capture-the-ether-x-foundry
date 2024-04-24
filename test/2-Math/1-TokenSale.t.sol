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
    }

    function testSolveTokenSale() public {
        TokenSaleChallenge challenge = TokenSaleChallenge(payable(challengeAddress));

        // [START]

        // [END]

        assertTrue(challenge.isComplete());
    }
}
