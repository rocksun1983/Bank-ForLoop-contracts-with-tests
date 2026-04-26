// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ForLoop {

    struct Account {
        address user;
        uint256 balance;
    }

    Account[] public accounts;

    function addMultipleAccounts(
        address[] memory _users,
        uint256[] memory _balances
    ) public {
        require(_users.length == _balances.length, "Mismatch");

        for (uint i = 0; i < _users.length; i++) {
            accounts.push(Account(_users[i], _balances[i]));
        }
    }

    function getAccountsCount() public view returns (uint) {
        return accounts.length;
    }
}