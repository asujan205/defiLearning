// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.6;
pragma abicoder v2;
import '@uniswap/v3-periphery/contracts/libraries/TransferHelper.sol';
import '@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol';


contract SingleSwap {

    address private constant UNISWAP_V3_ROUTER = 0xE592427A0AEce92De3Edee1F18E0157C05861564;
    ISwapRouter private uniswapV3Router;
    
    address public constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address public constant WETH9 = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address public constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

    uint24 public constant DAI_USDC_POOL_FEE = 3000;

    constructor() {
        uniswapV3Router = ISwapRouter(UNISWAP_V3_ROUTER);
    }

    function SwapExactInputSingle (unit256 amountIn) external returns (uint256 amountOut){
        TransferHelper.safeApprove(DAI, UNISWAP_V3_ROUTER, amountIn);
        TransferHelper.safeTransferFrom(Dai, msg.sender,address(this), amountIn);

        ISwapRouter.ExactInputSingleParams memory params =
            ISwapRouter.ExactInputSingleParams({
                tokenIn: DAI,
                tokenOut: WETH9,
                fee: DAI_USDC_POOL_FEE,
                recipient: msg.sender,
                deadline: block.timestamp + 1800,
                amountIn: amountIn,
                amountOutMinimum: 0,
                sqrtPriceLimitX96: 0
            });

        amountOut = uniswapV3Router.exactInputSingle(params);
    }
}