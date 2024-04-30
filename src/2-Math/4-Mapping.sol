// Who needs mappings? I’ve created a contract that can store key/value pairs using just an array.

// pragma solidity ^0.4.21;
pragma solidity ^0.5.0;

contract MappingChallenge {
    bool public isComplete; // slot 0
    uint256[] map; // slot 1

    function set(uint256 key, uint256 value) public {
        // Expand dynamic array as needed
        if (map.length <= key) {
            map.length = key + 1;
        }

        map[key] = value;
    }

    function get(uint256 key) public view returns (uint256) {
        return map[key];
    }
}

// Enjoy this inspirational music while you work: Map To My Heart. https://www.youtube.com/watch?v=A259WnFMRXI
