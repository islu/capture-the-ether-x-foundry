// This contract can only be used by me (smarx). I don’t trust myself to remember my private key, so I’ve made it so whatever address I’m using in the future will work:
//  1. I always use a wallet contract that returns “smarx” if you ask its name.
//  2. Everything I write has bad code in it, so my address always includes the hex string badc0de.
//
// To complete this challenge, steal my identity!

// pragma solidity ^0.4.21;
pragma solidity ^0.6.2;

interface IName {
    function name() external view returns (bytes32);
}

contract FuzzyIdentityChallenge {
    bool public isComplete;

    function authenticate() public {
        require(isSmarx(msg.sender));
        require(isBadCode(msg.sender));

        isComplete = true;
    }

    function isSmarx(address addr) internal view returns (bool) {
        return IName(addr).name() == bytes32("smarx");
    }

    function isBadCode(address _addr) internal pure returns (bool) {
        bytes20 addr = bytes20(_addr);
        bytes20 id = hex"000000000000000000000000000000000badc0de";
        bytes20 mask = hex"000000000000000000000000000000000fffffff";

        for (uint256 i = 0; i < 34; i++) {
            if (addr & mask == id) {
                return true;
            }
            mask <<= 4;
            id <<= 4;
        }

        return false;
    }
}

// Enjoy this inspirational music while you work: Research Me Obsessively. https://www.youtube.com/watch?v=8wxBLq_C2KQ
