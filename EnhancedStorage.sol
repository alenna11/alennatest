// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EnhancedStorage {
    uint256 private storedNumber;
    address public owner;

    event NumberUpdated(address indexed updater, uint256 newValue);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    // Update the stored number (only owner can do this)
    function set(uint256 _num) public onlyOwner {
        storedNumber = _num;
        emit NumberUpdated(msg.sender, _num);
    }

    // Retrieve the stored number
    function get() public view returns (uint256) {
        return storedNumber;
    }

    // Transfer ownership to someone else
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Invalid address");
        owner = newOwner;
    }
}
