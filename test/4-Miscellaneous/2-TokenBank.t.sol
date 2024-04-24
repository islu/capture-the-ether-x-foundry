// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {TokenBankChallenge, SimpleERC223Token} from "../../src/4-Miscellaneous/2-TokenBank.sol";

contract TokenBankTest is Test {
    address player;

    address challengeAddress;

    function setUp() public {
        player = makeAddr("player");
        TokenBankChallenge challenge = new TokenBankChallenge(payable(player));
        challengeAddress = payable(address(challenge));
    }

    function testSolveTokenBank() public {
        TokenBankChallenge challenge = TokenBankChallenge(payable(challengeAddress));
        SimpleERC223Token token = SimpleERC223Token(challenge.token());

        // [START]

        // [END]

        assertTrue(challenge.isComplete());
    }
}
