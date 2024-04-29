// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {AssumeOwnershipChallenge} from "../../src/4-Miscellaneous/1-AssumeOwnership.sol";

contract AssumeOwnershipTest is Test {
    address challengeAddress;

    function setUp() public {
        AssumeOwnershipChallenge challenge = new AssumeOwnershipChallenge();
        challengeAddress = payable(address(challenge));
    }

    function testSolveAssumeOwnership() public {
        AssumeOwnershipChallenge challenge = AssumeOwnershipChallenge(payable(challengeAddress));

        // [START]

        challenge.AssumeOwmershipChallenge();
        challenge.authenticate();

        // [END]

        assertTrue(challenge.isComplete());
    }
}
