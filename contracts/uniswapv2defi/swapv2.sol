// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@uniswap/v2-core/contracts/interfaces/IUniswapV2Factory.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Pair.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract TestSwap{

    address  private constant UNISWAP_V2_ROUTER = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    IUniswapV2Router02 private uniswapV2Router;
    
    constructor() {
        uniswapV2Router = IUniswapV2Router02(UNISWAP_V2_ROUTER);
    }


    function AddLiquidity(address token0, address token1, uint256 amountIn, uint256 amountOut ) external {
        IERC20(token0).approve(UNISWAP_V2_ROUTER, amountIn);
        IERC20(token1).approve(UNISWAP_V2_ROUTER, amountOut);
        uniswapV2Router.addLiquidity(token0, token1, amountIn, amountOut, 0, 0, address(this), block.timestamp + 1800);


    }
    





}

