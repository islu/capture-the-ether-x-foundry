// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.2;

import {Test, console} from "forge-std/Test.sol";
import {CaptureTheEther, NicknameChallenge} from "../../src/0-Warmup/3-ChooseANickname.sol";

contract ChooseANicknameTest is Test {
    address player;

    address challengeAddress;
    address captureTheEtherAddress;

    function setUp() public {
        player = makeAddr("player");

        CaptureTheEther cte = new CaptureTheEther();
        vm.prank(address(cte));
        NicknameChallenge challenge = new NicknameChallenge(player);

        captureTheEtherAddress = address(cte);
        challengeAddress = address(challenge);
    }

    function testSolveNickname() public {
        CaptureTheEther cte = CaptureTheEther(captureTheEtherAddress);
        NicknameChallenge challenge = NicknameChallenge(challengeAddress);

        // [START]

        // [END]

        assertTrue(challenge.isComplete());
    }
}
