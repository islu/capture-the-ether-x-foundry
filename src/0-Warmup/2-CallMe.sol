// To complete this challenge, all you need to do is call a function.
//
// The “Begin Challenge” button will deploy the following contract:

// pragma solidity ^0.4.21;
pragma solidity ^0.6.2;

contract CallMeChallenge {
    bool public isComplete = false;

    function callme() public {
        isComplete = true;
    }
}

// Call the function named callme and then click the “Check Solution” button.
//
// Enjoy this inspirational music while you work: Call On Me. https://www.youtube.com/watch?v=7ou6MoKmxFQ
