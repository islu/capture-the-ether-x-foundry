// Putting the answer in the code makes things a little too easy.
//
// This time I’ve only stored the hash of the number. Good luck reversing a cryptographic hash!

// pragma solidity ^0.4.21;
pragma solidity ^0.6.2;

contract GuessTheSecretNumberChallenge {
    bytes32 answerHash = 0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365;

    // function GuessTheSecretNumberChallenge() public payable {
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

        // if (keccak256(n) == answerHash) {
        //     msg.sender.transfer(2 ether);
        // }
        if (keccak256(abi.encodePacked(n)) == answerHash) {
            msg.sender.transfer(2 ether);
        }
    }
}

// Enjoy this inspirational music while you work: Mr. Roboto. https://www.youtube.com/watch?v=uc6f_2nPSX8
