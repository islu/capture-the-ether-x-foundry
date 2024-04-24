// I’m thinking of a number. All you have to do is guess it.

// pragma solidity ^0.4.21;
pragma solidity ^0.6.2;

contract GuessTheNumberChallenge {
    uint8 answer = 42;

    // function GuessTheNumberChallenge() public payable {
    //     require(msg.value == 1 ether);
    // }
    constructor() public payable {
        require(msg.value == 1 ether);
    }

    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function guess(uint8 n) public payable {
        require(msg.value == 1 ether);

        if (n == answer) {
            msg.sender.transfer(2 ether);
        }
    }
}

// Enjoy this inspirational music while you work: Guessing Games. https://www.youtube.com/watch?v=jgJPSjt1L1M
