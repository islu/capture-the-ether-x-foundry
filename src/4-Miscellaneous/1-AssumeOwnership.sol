// To complete this challenge, become the owner.

// pragma solidity ^0.4.21;
pragma solidity ^0.6.2;

contract AssumeOwnershipChallenge {
    address owner;
    bool public isComplete;

    function AssumeOwmershipChallenge() public {
        owner = msg.sender;
    }

    function authenticate() public {
        require(msg.sender == owner);

        isComplete = true;
    }
}

// Enjoy this inspirational music while you work: Owner Of A Lonely Heart. https://www.youtube.com/watch?v=ytc4_JJWqMQ
