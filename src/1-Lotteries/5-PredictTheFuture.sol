// This time, you have to lock in your guess before the random number is generated. To give you a sporting chance, there are only ten possible answers.
//
// Note that it is indeed possible to solve this challenge without losing any ether.

// pragma solidity ^0.4.21;
pragma solidity ^0.6.2;

contract PredictTheFutureChallenge {
    address guesser;
    uint8 guess;
    uint256 settlementBlockNumber;

    // function PredictTheFutureChallenge() public payable {
    //     require(msg.value == 1 ether);
    // }
    constructor() public payable {
        require(msg.value == 1 ether);
    }

    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function lockInGuess(uint8 n) public payable {
        require(guesser == address(0)); // require(guesser == 0);
        require(msg.value == 1 ether);

        guesser = msg.sender;
        guess = n;
        settlementBlockNumber = block.number + 1;
    }

    function settle() public {
        require(msg.sender == guesser);
        require(block.number > settlementBlockNumber);

        // uint8 answer = uint8(keccak256(block.blockhash(block.number - 1), now)) % 10;
        uint8 answer = uint8(uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp)))) % 10;

        guesser = address(0); // guesser = 0;
        if (guess == answer) {
            msg.sender.transfer(2 ether);
        }
    }
}

// Enjoy this inspirational music while you work: I Predict. https://www.youtube.com/watch?v=TH5USLpPa_0
