// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {GuessTheRandomNumberChallenge} from "../../src/1-Lotteries/3-GuessTheRandomNumber.sol";

contract GuessTheRandomNumberTest is Test {
    address challengeAddress;

    function setUp() public {
        GuessTheRandomNumberChallenge challenge = new GuessTheRandomNumberChallenge{value: 1 ether}();
        challengeAddress = payable(address(challenge));
    }

    function testSolveGuessTheRandomNumber() public {
        GuessTheRandomNumberChallenge challenge = GuessTheRandomNumberChallenge(payable(challengeAddress));

        // [START]

        // [END]

        assertTrue(challenge.isComplete());
    }
}
