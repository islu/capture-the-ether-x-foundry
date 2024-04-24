// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {GuessTheSecretNumberChallenge} from "../../src/1-Lotteries/2-GuessTheSecretNumber.sol";

contract GuessTheSecretNumberTest is Test {
    address challengeAddress;

    function setUp() public {
        GuessTheSecretNumberChallenge challenge = new GuessTheSecretNumberChallenge{value: 1 ether}();
        challengeAddress = payable(address(challenge));
    }

    function testSolveGuessTheSecretNumber() public {
        GuessTheSecretNumberChallenge challenge = GuessTheSecretNumberChallenge(payable(challengeAddress));

        // [START]

        // [END]

        assertTrue(challenge.isComplete());
    }
}
