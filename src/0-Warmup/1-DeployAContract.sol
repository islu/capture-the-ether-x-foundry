// To complete this challenge, you need to:
//  1. Install MetaMask.
//  2. Switch to the Ropsten test network.
//  2. Get some Ropsten ether. Clicking the “buy” button in MetaMask will take you to a faucet that gives out free test ether.
//
// After you’ve done that, press the red button on the left to deploy the challenge contract.
//
// You don’t need to do anything with the contract once it’s deployed. Just click the “Check Solution” button to verify that you deployed successfully.

// pragma solidity ^0.4.21;
pragma solidity ^0.6.2;

contract DeployChallenge {
    // This tells the CaptureTheFlag contract that the challenge is complete.
    function isComplete() public pure returns (bool) {
        return true;
    }
}

// Enjoy this inspirational music while you work: Hello. https://www.youtube.com/watch?v=LT7MOirwZdM
