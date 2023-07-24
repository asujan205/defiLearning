// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract AaveLikeProtocol {
    struct LendingPool {
        mapping(address => uint256) balances;
        mapping(address => uint256) borrowAmounts;
        uint256 totalDeposits;
        uint256 totalBorrowed;
        uint256 borrowInterestRate; // Represented in basis points (1 basis point = 0.01%)
    }

    IERC20 public lendingToken;
    uint256 public totalSupply;
    mapping(address => LendingPool) public pools;

    event Deposit(address indexed depositor, uint256 amount);
    event Borrow(address indexed borrower, uint256 amount);
    event Repay(address indexed borrower, uint256 amount);

    constructor(address _lendingToken) {
        lendingToken = IERC20(_lendingToken);
    }

    function deposit(uint256 _amount) external {
        require(_amount > 0, "Amount must be greater than zero");

        lendingToken.transferFrom(msg.sender, address(this), _amount);
        pools[msg.sender].balances[msg.sender] += _amount;
        pools[msg.sender].totalDeposits += _amount;
        totalSupply += _amount;

        emit Deposit(msg.sender, _amount);
    }

    function borrow(uint256 _amount) external {
        require(_amount > 0, "Amount must be greater than zero");
        require(_amount <= (totalSupply - pools[msg.sender].totalBorrowed), "Not enough available to borrow");

        pools[msg.sender].borrowAmounts[msg.sender] += _amount;
        pools[msg.sender].totalBorrowed += _amount;

        emit Borrow(msg.sender, _amount);
    }

    function repay(uint256 _amount) external {
        require(_amount > 0, "Amount must be greater than zero");
        require(_amount <= pools[msg.sender].borrowAmounts[msg.sender], "Not enough borrow balance");

        lendingToken.transferFrom(msg.sender, address(this), _amount);
        pools[msg.sender].borrowAmounts[msg.sender] -= _amount;
        pools[msg.sender].totalBorrowed -= _amount;

        emit Repay(msg.sender, _amount);
    }

    function getDepositBalance(address _user) public view returns (uint256) {
        return pools[_user].balances[_user];
    }

    function getBorrowBalance(address _user) public view returns (uint256) {
        return pools[_user].borrowAmounts[_user];
    }
}
