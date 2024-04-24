// Recall that an address is the last 20 bytes of the keccak-256 hash of the address’s public key.
//
// To complete this challenge, find the public key for the owner's account.

// pragma solidity ^0.4.21;
pragma solidity ^0.6.2;

contract PublicKeyChallenge {
    address owner = 0x92b28647Ae1F3264661f72fb2eB9625A89D88A31;
    bool public isComplete;

    function authenticate(bytes calldata publicKey) public {
        // require(address(keccak256(publicKey)) == owner);
        require(address(uint256(keccak256(abi.encodePacked(publicKey)))) == owner);

        isComplete = true;
    }
}

// Enjoy this inspirational music while you work: Public Key Infrastructure. https://www.youtube.com/watch?v=Qp9JriLfH1w
