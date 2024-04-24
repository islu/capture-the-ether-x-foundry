// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {RetirementFundChallenge} from "../../src/2-Math/3-RetirementFund.sol";

contract RetirementFundTest is Test {
    address player;

    address challengeAddress;

    function setUp() public {
        player = makeAddr("player");
        RetirementFundChallenge challenge = new RetirementFundChallenge{value: 1 ether}(payable(player));
        challengeAddress = payable(address(challenge));
    }

    function testSolveRetirementFund() public {
        RetirementFundChallenge challenge = RetirementFundChallenge(payable(challengeAddress));

        // [START]

        // [END]

        assertTrue(challenge.isComplete());
    }
}
