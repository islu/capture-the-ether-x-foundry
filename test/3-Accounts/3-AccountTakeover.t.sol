// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {AccountTakeoverChallenge} from "../../src/3-Accounts/3-AccountTakeover.sol";

contract AccountTakeoverTest is Test {
    address challengeAddress;

    function setUp() public {
        AccountTakeoverChallenge challenge = new AccountTakeoverChallenge();
        challengeAddress = address(challenge);
    }

    function testSolveAccountTakeover() public {
        AccountTakeoverChallenge challenge = AccountTakeoverChallenge(challengeAddress);

        // [START]

        // [END]

        assertTrue(challenge.isComplete());
    }
}
