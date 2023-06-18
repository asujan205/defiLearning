// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
    import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
    import "@openzeppelin/contracts/access/Ownable.sol";

contract MyDefi {
    address public token1;
    address public token2;
    uint256 public reserve1;
    uint256 public reserve2;
    uint256 public FeePercentage;

    AggregatorV3Interface internal priceFeed1;


    event Swap(address indexed _fromToken, address indexed _toToken, uint256 _amountIn, uint256 _amountOut);

    constructor(address _token1, address _token2, address _priceFeed1 , uint256 _FeePercentage) {
        token1 = _token1;
        token2 = _token2;
        priceFeed1 = AggregatorV3Interface(_priceFeed1);
        FeePercentage = _FeePercentage;
    }

    function getReservee() public view returns (uint256 , uint256) {
        _reserve1 = reserve1;
        _reserve2 = reserve2;

        return (_reserve1, _reserve2);
    }

    function AddLiquidity (uint256 _Amount1 , uint256 _Amount2){
        require(_Amount1 > 0 && _Amount2 > 0 , "Amount must be greater than 0");
        IERC20(token1).transferFrom(msg.sender, address(this), _Amount1);
        IERC20(token2).transferFrom(msg.sender, address(this), _Amount2);
        reserve1 += _Amount1;
        reserve2 += _Amount2;
    }







}