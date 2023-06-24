// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@uniswap/v2-core/contracts/interfaces/IUniswapV2Factory.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Pair.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@uniswap/v2-core/contracts/interfaces/IUniswapV2Pair.sol";
import "@uniswap/v2-periphery/contracts/libraries/UniswapV2Library.sol";


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


    function swapTokenForToken (address tokenIn, address tokenOut, uint256 amountIn, uint256 amountOutMin, address to) external {
         address pair = UniswapV2Library.pairFor(
            UniswapV2Library.getFactoryAddress(),
            tokenIn,
            tokenOut
        );
           address token0 = UniswapV2Pair(pair).token0();
        address token1 = UniswapV2Pair(pair).token1();
        IERC20(tokenIn).approve(UNISWAP_V2_ROUTER, amountIn);


        address[] memory path;
        path = new address[](2);
        path[0] = tokenIn;
        path[1] = tokenOut;
        uniswapV2Router.swapExactTokensForTokens(amountIn, amountOutMin, path, to, block.timestamp + 1800);


    }

    function swapTokenForETH (address tokenIn, uint256 amountIn, uint256 amountOutMin, address to) external {
        address[] memory path;
        path = new address[](2);
        path[0] = tokenIn;
        path[1] = uniswapV2Router.WETH();
        IERC20(tokenIn).approve(UNISWAP_V2_ROUTER, amountIn);
        uniswapV2Router.swapExactTokensForETH(amountIn, amountOutMin, path, to, block.timestamp + 1800);
    }


    function swapETHForToken (address tokenOut, uint256 amountOutMin, address to) external payable {
        address[] memory path;
        path = new address[](2);
        path[0] = uniswapV2Router.WETH();
        path[1] = tokenOut;
        uniswapV2Router.swapExactETHForTokens{value: msg.value}(amountOutMin, path, to, block.timestamp + 1800);
    }

function RemoveLiquidity(address tokenA, address tokenB, uint256 liquidity) external {
    address pair = UniswapV2Library.pairFor(
            UniswapV2Library.getFactoryAddress(),
            tokenA,
            tokenB
        );
    IERC20(pair).approve(UNISWAP_V2_ROUTER, liquidity);
     uniswapRouter.removeLiquidity(
            tokenA,
            tokenB,
            liquidity,
            0,
            0,
            address(this),
            block.timestamp + 3600
        );
}
 


  


   





}

