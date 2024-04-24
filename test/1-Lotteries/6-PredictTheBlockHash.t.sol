// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {PredictTheBlockHashChallenge} from "../../src/1-Lotteries/6-PredictTheBlockHash.sol";

contract PredictTheBlockHashTest is Test {
    address challengeAddress;

    function setUp() public {
        PredictTheBlockHashChallenge challenge = new PredictTheBlockHashChallenge{value: 1 ether}();
        challengeAddress = payable(address(challenge));
    }

    function testSolvePredictTheBlockHash() public {
        PredictTheBlockHashChallenge challenge = PredictTheBlockHashChallenge(payable(challengeAddress));

        // [START]

        // [END]

        assertTrue(challenge.isComplete());
    }
}
