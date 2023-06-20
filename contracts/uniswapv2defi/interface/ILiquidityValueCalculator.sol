// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

interface ILiquidityValueCalculator {
    function computeLiquidityShareValue(uint liquidity, address tokenA, address tokenB) external returns (uint tokenAAmount, uint tokenBAmount);
}