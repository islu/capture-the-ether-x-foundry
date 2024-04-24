// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2; // https://github.com/foundry-rs/foundry/issues/4376
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {DeployChallenge} from "../../src/0-Warmup/1-DeployAContract.sol";

contract DeployAContractTest is Test {
    address challengeAddress;

    function setUp() public {
        DeployChallenge challenge = new DeployChallenge();
        challengeAddress = address(challenge);
    }

    function testSolveDeploy() public {
        DeployChallenge challenge = DeployChallenge(challengeAddress);

        // [START]

        // Noting to do here.

        // [END]

        assertTrue(challenge.isComplete());
    }
}
