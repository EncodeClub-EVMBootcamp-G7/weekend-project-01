// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// Define an interface for the project that outlines the required functions
interface projectInterface {
    // Function to retrieve the current text
    function helloWorld() external view returns (string memory); // Returns the current text as a string
    
    // Function to set a new text value
    function setText(string calldata newText) external; // Accepts a new text string to set

    // Function to transfer ownership of the contract
    function transferOwnership(address newOwner) external; // Transfers contract ownership to a new address
}

// Implementation of the project interface
contract HelloWorld is projectInterface {
    // State variable to store the text
    string private text; // Private variable accessible only within this contract
    
    // State variable to store the contract owner's address
    address public owner; // Public variable for the owner's address

    // Constructor to initialize the contract state
    constructor() {
        owner = msg.sender; // Set the contract deployer as the initial owner
        text = "hello world"; // Initialize text with a default value
    }

    // Modifier to restrict access to certain functions to the owner only
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner"); // Ensure that the caller is the owner
        _; // Placeholder for the function body
    }

    // Implementation of the helloWorld function from the interface
    function helloWorld() external view override returns (string memory) {
        return text; // Return the current text value
    }

    // Implementation of the setText function from the interface
    function setText(string calldata newText) external override onlyOwner {
        text = newText; // Set the new text value, accessible only to the owner
    }

    // Implementation of the transferOwnership function from the interface
    function transferOwnership(address newOwner) external override onlyOwner {
        owner = newOwner; // Update the owner address to the new owner
    }
}
