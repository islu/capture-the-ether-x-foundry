// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {GuessTheNumberChallenge} from "../../src/1-Lotteries/1-GuessTheNumber.sol";

contract GuessTheNumberTest is Test {
    address challengeAddress;

    function setUp() public {
        GuessTheNumberChallenge challenge = new GuessTheNumberChallenge{value: 1 ether}();
        challengeAddress = payable(address(challenge));
    }

    function testSolveGuessTheNumber() public {
        GuessTheNumberChallenge challenge = GuessTheNumberChallenge(payable(challengeAddress));

        // [START]

        // [END]

        assertTrue(challenge.isComplete());
    }
}
