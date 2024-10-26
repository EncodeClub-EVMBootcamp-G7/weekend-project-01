// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

interface projectInterface {
    function helloWorld() external view returns (string memory); // Returns string
    function setText(string calldata newText) external; // Set new text
    function transferOwnership(address newOwner) external; // Transfer ownership
}

contract HelloWorld is projectInterface {
    string private text;
    address public owner;

    constructor() {
        owner = msg.sender; // Set the contract deployer as the initial owner
        text="hello world";
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    function helloWorld() external view override returns (string memory) {
        return text; // Return the current text
    }

    function setText(string calldata newText) external override onlyOwner {
        text = newText; // Set new text only if caller is owner
    }

    function transferOwnership(address newOwner) external override onlyOwner {
        owner = newOwner; // Transfer ownership
    }
}
