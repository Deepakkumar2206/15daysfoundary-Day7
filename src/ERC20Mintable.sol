// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// Import OpenZeppelin ERC20 + Ownable
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ERC20Mintable is ERC20, Ownable {
    constructor() ERC20("Day7Token", "D7T") Ownable(msg.sender) {}

    /// @notice Only owner can mint new tokens
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
