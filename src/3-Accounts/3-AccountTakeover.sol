// To complete this challenge, send a transaction from the owner's account.

// pragma solidity ^0.4.21;
pragma solidity ^0.6.2;

contract AccountTakeoverChallenge {
    address owner = 0x6B477781b0e68031109f21887e6B5afEAaEB002b;
    bool public isComplete;

    function authenticate() public {
        require(msg.sender == owner);

        isComplete = true;
    }
}

// Enjoy this inspirational music while you work: Pinky and The Brain Intro. https://www.youtube.com/watch?v=GBkT19uH2RQ
