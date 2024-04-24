// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {FuzzyIdentityChallenge} from "../../src/3-Accounts/1-FuzzyIdentity.sol";

contract FuzzyIdentityTest is Test {
    address challengeAddress;

    function setUp() public {
        FuzzyIdentityChallenge challenge = new FuzzyIdentityChallenge();
        challengeAddress = payable(address(challenge));
    }

    function testSolveFuzzyIdentity() public {
        FuzzyIdentityChallenge challenge = FuzzyIdentityChallenge(payable(challengeAddress));

        // [START]

        // [END]

        assertTrue(challenge.isComplete());
    }
}
