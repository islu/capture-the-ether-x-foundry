// The number is now generated on-demand when a guess is made.

// pragma solidity ^0.4.21;
pragma solidity ^0.6.2;

contract GuessTheNewNumberChallenge {
    // function GuessTheNewNumberChallenge() public payable {
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
        // uint8 answer = uint8(keccak256(block.blockhash(block.number - 1), now));
        uint8 answer = uint8(uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp))));

        if (n == answer) {
            msg.sender.transfer(2 ether);
        }
    }
}

// Enjoy this inspirational music while you work: I Guess It’s Christmas Time. https://www.youtube.com/watch?v=Qu3aqM1BnLc
