// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
    import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
    import "@openzeppelin/contracts/access/Ownable.sol";

contract MyDefi {
    address public token1;
    address public token2;
    uint256 public reverse1;
    uint256 public reverse2;
    uint256 public FeePercentage;

    AggregatorV3Interface internal priceFeed1;


    event Swap(address indexed _fromToken, address indexed _toToken, uint256 _amountIn, uint256 _amountOut);

    constructor(address _token1, address _token2, address _priceFeed1 , uint256 _FeePercentage) {
        token1 = _token1;
        token2 = _token2;
        priceFeed1 = AggregatorV3Interface(_priceFeed1);
        FeePercentage = _FeePercentage;
    }




}