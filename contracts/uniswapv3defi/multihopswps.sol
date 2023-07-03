// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity =0.7.6;
pragma abicoder v2


import '@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol';
import '@uniswap/v3-periphery/contracts/libraries/TransferHelper.sol';


contract SwapMultiHops{
        ISwapRouter public immutable swapRouter;

        constructor(ISwapRouter _swapRouter) {
            swapRouter = _swapRouter;
        }

        
}