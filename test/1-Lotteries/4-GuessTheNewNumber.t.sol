// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {GuessTheNewNumberChallenge} from "../../src/1-Lotteries/4-GuessTheNewNumber.sol";

contract GuessTheNewNumberTest is Test {
    address challengeAddress;

    function setUp() public {
        GuessTheNewNumberChallenge challenge = new GuessTheNewNumberChallenge{value: 1 ether}();
        challengeAddress = payable(address(challenge));
    }

    function testSolveGuessTheNewNumber() public {
        GuessTheNewNumberChallenge challenge = GuessTheNewNumberChallenge(payable(challengeAddress));

        // [START]

        // [END]

        assertTrue(challenge.isComplete());
    }
}
