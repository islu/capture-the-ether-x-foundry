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

        bytes32 answerHash = 0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365;
        uint256 answer;
        for (uint256 i = 0; i < 256; i++) {
            if (keccak256(abi.encodePacked(uint8(i))) == answerHash) {
                answer = i;
                break;
            }
        }
        console.log("The answer is: ", answer);

        challenge.guess{value: 1 ether}(uint8(answer));

        // [END]

        assertTrue(challenge.isComplete());
    }

    receive() external payable {}
}
