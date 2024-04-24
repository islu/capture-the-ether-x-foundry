// Guessing an 8-bit number is apparently too easy. This time, you need to predict the entire 256-bit block hash for a future block.

// pragma solidity ^0.4.21;
pragma solidity ^0.6.2;

contract PredictTheBlockHashChallenge {
    address guesser;
    bytes32 guess;
    uint256 settlementBlockNumber;

    // function PredictTheBlockHashChallenge() public payable {
    //     require(msg.value == 1 ether);
    // }
    constructor() public payable {
        require(msg.value == 1 ether);
    }

    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function lockInGuess(bytes32 hash) public payable {
        require(guesser == address(0)); // require(guesser == 0);
        require(msg.value == 1 ether);

        guesser = msg.sender;
        guess = hash;
        settlementBlockNumber = block.number + 1;
    }

    function settle() public {
        require(msg.sender == guesser);
        require(block.number > settlementBlockNumber);

        // bytes32 answer = block.blockhash(settlementBlockNumber);
        bytes32 answer = blockhash(settlementBlockNumber);

        guesser = address(0); // guesser = 0;
        if (guess == answer) {
            msg.sender.transfer(2 ether);
        }
    }
}

// Enjoy this inspirational music while you work: Get Lucky. https://www.youtube.com/watch?v=VbTrdj7vPGU
