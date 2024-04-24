// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {CallMeChallenge} from "../../src/0-Warmup/2-CallMe.sol";

contract CallMetTest is Test {
    address challengeAddress;

    function setUp() public {
        CallMeChallenge challenge = new CallMeChallenge();
        challengeAddress = address(challenge);
    }

    function testSolveCallMe() public {
        CallMeChallenge challenge = CallMeChallenge(challengeAddress);

        // [START]

        // [END]

        assertTrue(challenge.isComplete());
    }
}
