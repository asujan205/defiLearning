// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.6;
pragma abicoder v2;
import '@uniswap/v3-periphery/contracts/libraries/TransferHelper.sol';
import '@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol';


contract SwapMultiHops{
        ISwapRouter public immutable swapRouter;

        constructor(ISwapRouter _swapRouter) {
            swapRouter = _swapRouter;
        }

          address public constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address public constant WETH9 = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address public constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

        uint24 public constant poolFee = 3000;

function  swapExactInputMultiHop(uint256 _amountIn) public returns (uint256 amountOut) {
       // Transfer `amountIn` of DAI to this contract.
        TransferHelper.safeTransferFrom(DAI, msg.sender, address(this), _amountIn);

        // Approve the router to spend DAI.
        TransferHelper.safeApprove(DAI, address(swapRouter), _amountIn);
      
          ISwapRouter.ExactInputParams memory params =
            ISwapRouter.ExactInputParams({
                path: abi.encodePacked(DAI, poolFee, USDC, poolFee, WETH9),
                recipient: msg.sender,
                deadline: block.timestamp,
                amountIn: _amountIn,
                amountOutMinimum: 0
            });

        // Executes the swap.
        amountOut = swapRouter.exactInput(params);
    }


}