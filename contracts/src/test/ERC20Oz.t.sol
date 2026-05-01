// SPDX-License-Identifier: MIT
pragma solidity 0.8.33;

import "forge-std/Test.sol";
import "../src/ERC20OZ.sol";

contract ERC20OZTest is Test {

    ERC20OZ token;

    address owner = address(this);
    address user = address(1);

    // 🔹 Setup runs before each test
    function setUp() public {
        token = new ERC20OZ("MyToken", "MTK");
    }

    // ✅ 1. Test initial supply minted to contract
    function testInitialSupply() public {
        uint balance = token.balanceOf(address(token));
        assertEq(balance, 10000000000);
    }

    // ✅ 2. Test mint function (only owner)
    function testMintByOwner() public {
        token.mint(1000, user);

        uint balance = token.balanceOf(user);
        assertEq(balance, 1000);
    }

    

    // ✅ 3. Test burn function
    function testBurn() public {
        uint initial = token.balanceOf(address(token));

        token.burn(1000);

        uint finalBalance = token.balanceOf(address(token));
        assertEq(finalBalance, initial - 1000);
    }

    

    // ✅ 4. Test token name
    function testTokenName() public {
        assertEq(token.name(), "MyToken");
    }

    // ✅ 5. Test token symbol
    function testTokenSymbol() public {
        assertEq(token.symbol(), "MTK");
    }
}