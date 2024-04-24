// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {PublicKeyChallenge} from "../../src/3-Accounts/2-PublicKey.sol";

contract PublicKeyTest is Test {
    address challengeAddress;

    function setUp() public {
        PublicKeyChallenge challenge = new PublicKeyChallenge();
        challengeAddress = address(challenge);
    }

    function testSolvePublicKey() public {
        PublicKeyChallenge challenge = PublicKeyChallenge(challengeAddress);

        // [START]

        // [END]

        assertTrue(challenge.isComplete());
    }
}
