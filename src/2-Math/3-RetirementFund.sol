// This retirement fund is what economists call a commitment device. I’m trying to make sure I hold on to 1 ether for retirement. https://en.wikipedia.org/wiki/Commitment_device
//
// I’ve committed 1 ether to the contract below, and I won’t withdraw it until 10 years have passed. If I do withdraw early, 10% of my ether goes to the beneficiary (you!).
//
// I really don’t want you to have 0.1 of my ether, so I’m resolved to leave those funds alone until 10 years from now. Good luck!

// pragma solidity ^0.4.21;
pragma solidity ^0.6.2;

contract RetirementFundChallenge {
    uint256 startBalance;
    address owner = msg.sender;
    address beneficiary;
    uint256 expiration = block.timestamp + 10 * 365 days; // uint256 expiration = now + 10 years;

    // function RetirementFundChallenge(address player) public payable {
    //
    //     require(msg.value == 1 ether);
    //     beneficiary = player;
    //     startBalance = msg.value;
    // }
    constructor(address player) public payable {
        require(msg.value == 1 ether);

        beneficiary = player;
        startBalance = msg.value;
    }

    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function withdraw() public {
        require(msg.sender == owner);

        if (now < expiration) {
            // early withdrawal incurs a 10% penalty
            msg.sender.transfer(address(this).balance * 9 / 10);
        } else {
            msg.sender.transfer(address(this).balance);
        }
    }

    function collectPenalty() public {
        require(msg.sender == beneficiary);

        uint256 withdrawn = startBalance - address(this).balance;

        // an early withdrawal occurred
        require(withdrawn > 0);

        // penalty is what's left
        msg.sender.transfer(address(this).balance);
    }
}

// Enjoy this inspirational music while you work: Smooth Criminal. https://www.youtube.com/watch?v=Mx0xCI1jaUM
