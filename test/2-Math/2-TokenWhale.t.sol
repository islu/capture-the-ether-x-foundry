// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {TokenWhaleChallenge} from "../../src/2-Math/2-TokenWhale.sol";

contract TokenWhaleTest is Test {
    address player;

    address challengeAddress;

    function setUp() public {
        player = makeAddr("player");
        TokenWhaleChallenge challenge = new TokenWhaleChallenge(payable(player));
        challengeAddress = payable(address(challenge));
    }

    function testSolveTokenWhale() public {
        TokenWhaleChallenge challenge = TokenWhaleChallenge(payable(challengeAddress));

        // [START]

        // [END]

        assertTrue(challenge.isComplete());
    }
}
