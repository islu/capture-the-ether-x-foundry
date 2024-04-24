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

        // https://neptunemutual.com/web3-tools/bytes32-to-string-converter/

        bytes32 nickname = bytes32("Nic");
        console.logBytes32(nickname);
        // console.logAddress(challenge.player());
        vm.prank(player);
        cte.setNickname(nickname);

        // console.logBytes1(cte.nicknameOf(player)[0]);
        // console.logBytes1(cte.nicknameOf(player)[1]);
        // console.logAddress(captureTheEtherAddress);
        // console.logAddress(address(cte));
        // console.logAddress(address(challenge.cte()));

        console.logBool(challenge.isComplete());

        // [END]

        assertTrue(challenge.isComplete());
    }
}
