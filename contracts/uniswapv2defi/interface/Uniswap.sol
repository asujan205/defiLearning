// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;


interface UniswapV2Router {

    function SwapExactTokenForToken(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);




}