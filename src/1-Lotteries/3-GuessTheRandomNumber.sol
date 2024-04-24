// This time the number is generated based on a couple fairly random sources.

// pragma solidity ^0.4.21;
pragma solidity ^0.6.2;

contract GuessTheRandomNumberChallenge {
    uint8 answer;

    // function GuessTheRandomNumberChallenge() public payable {
    //     require(msg.value == 1 ether);
    //     answer = uint8(keccak256(block.blockhash(block.number - 1), now));
    // }
    constructor() public payable {
        require(msg.value == 1 ether);
        // answer = uint8(keccak256(block.blockhash(block.number - 1), now));
        answer = uint8(uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp))));
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

// Enjoy this inspirational music while you work: The Random Song. https://www.youtube.com/watch?v=9ZkzZIUiHzs
