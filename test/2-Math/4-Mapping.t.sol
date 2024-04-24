// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.5.0;

import {DSTest} from "../utils/DSTest-05.sol";
import {MappingChallenge} from "../../src/2-Math/4-Mapping.sol";

import "forge-std/console.sol";

contract MappingTest is DSTest {
    address challengeAddress;

    function setUp() public {
        MappingChallenge challenge = new MappingChallenge();
        challengeAddress = address(challenge);
    }

    function testSolveMapping() public {
        MappingChallenge challenge = MappingChallenge(challengeAddress);

        // [START]

        // [END]

        assertTrue(challenge.isComplete());
    }
}
