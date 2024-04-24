// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {FiftyYearsChallenge} from "../../src/2-Math/6-FiftyYears.sol";

contract FiftyYearsTest is Test {
    address player;

    address challengeAddress;

    function setUp() public {
        player = makeAddr("player");
        FiftyYearsChallenge challenge = new FiftyYearsChallenge{value: 1 ether}(player);
        challengeAddress = payable(address(challenge));
    }

    function testSolveFiftyYears() public {
        FiftyYearsChallenge challenge = FiftyYearsChallenge(payable(challengeAddress));

        // [START]

        // [END]

        assertTrue(challenge.isComplete());
    }
}
