// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {PredictTheFutureChallenge} from "../../src/1-Lotteries/5-PredictTheFuture.sol";

contract PredictTheFutureTest is Test {
    address challengeAddress;

    function setUp() public {
        PredictTheFutureChallenge challenge = new PredictTheFutureChallenge{value: 1 ether}();
        challengeAddress = payable(address(challenge));
    }

    function testSolvePredictTheFuture() public {
        PredictTheFutureChallenge challenge = PredictTheFutureChallenge(payable(challengeAddress));

        // [START]

        // [END]

        assertTrue(challenge.isComplete());
    }
}
