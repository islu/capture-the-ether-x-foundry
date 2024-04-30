// A candidate you don’t like is accepting campaign contributions via the smart contract below.
//
// To complete this challenge, steal the candidate’s ether.

// pragma solidity ^0.4.21;
pragma solidity ^0.6.2;

contract DonationChallenge {
    struct Donation {
        uint256 timestamp;
        uint256 etherAmount;
    }

    Donation[] public donations;

    address public owner;

    // function DonationChallenge() public payable {
    //     require(msg.value == 1 ether);
    //
    //     owner = msg.sender;
    // }
    constructor() public payable {
        require(msg.value == 1 ether);

        owner = msg.sender;
    }

    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function donate(uint256 etherAmount) public payable {
        // amount is in ether, but msg.value is in wei
        uint256 scale = 10 ** 18 * 1 ether;
        require(msg.value == etherAmount / scale);

        Donation storage donation; // Donation donation;
        donation.timestamp = block.timestamp; // donation.timestamp = now;
        donation.etherAmount = etherAmount;

        donations.push(donation);
    }

    function withdraw() public {
        require(msg.sender == owner);

        msg.sender.transfer(address(this).balance);
    }
}

// Enjoy this inspirational music while you work: Space Force. https://www.youtube.com/watch?v=_AUXpnB065o
