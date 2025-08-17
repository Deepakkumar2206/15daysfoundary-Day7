// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "forge-std/Test.sol";
import "../src/ERC20Mintable.sol";

contract ERC20MintableTest is Test {
    ERC20Mintable token;
    address user1 = address(0x123);

    function setUp() public {
        token = new ERC20Mintable();
    }

    function testOwnerCanMint() public {
        token.mint(user1, 100 * 1e18);
        assertEq(token.balanceOf(user1), 100 * 1e18);
    }

    function test_RevertWhen_NonOwnerMints() public {
        vm.prank(user1);              // make user1 the caller
        vm.expectRevert();            // expect revert (since onlyOwner modifier fails)
        token.mint(user1, 50 * 1e18); // should revert
    }
}
