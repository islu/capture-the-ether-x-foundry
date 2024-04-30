// This ERC20-compatible token is hard to acquire. There’s a fixed supply of 1,000 tokens, all of which are yours to start with.
//
// Find a way to accumulate at least 1,000,000 tokens to solve this challenge.

// pragma solidity ^0.4.21;
pragma solidity ^0.6.2;

contract TokenWhaleChallenge {
    address player;

    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    string public name = "Simple ERC20 Token";
    string public symbol = "SET";
    uint8 public decimals = 18;

    // function TokenWhaleChallenge(address _player) public {
    //     player = _player;
    //     totalSupply = 1000;
    //     balanceOf[player] = 1000;
    // }
    constructor(address _player) public {
        player = _player;
        totalSupply = 1000;
        balanceOf[player] = 1000;
    }

    function isComplete() public view returns (bool) {
        return balanceOf[player] >= 1000000;
    }

    event Transfer(address indexed from, address indexed to, uint256 value);

    function _transfer(address to, uint256 value) internal {
        balanceOf[msg.sender] -= value; // underflow
        balanceOf[to] += value; // overflow

        emit Transfer(msg.sender, to, value);
    }

    function transfer(address to, uint256 value) public {
        require(balanceOf[msg.sender] >= value);
        require(balanceOf[to] + value >= balanceOf[to]); // overflow

        _transfer(to, value);
    }

    event Approval(address indexed owner, address indexed spender, uint256 value);

    function approve(address spender, uint256 value) public {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
    }

    function transferFrom(address from, address to, uint256 value) public {
        require(balanceOf[from] >= value);
        require(balanceOf[to] + value >= balanceOf[to]); // overflow
        require(allowance[from][msg.sender] >= value);

        allowance[from][msg.sender] -= value; // underflow
        _transfer(to, value);
    }
}

// Enjoy this inspirational music while you work: Tough Decisions. https://www.youtube.com/watch?v=cvcA8truev4
