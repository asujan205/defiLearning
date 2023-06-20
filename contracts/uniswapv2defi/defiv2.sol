// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;




import './interface/ILiquidityValueCalculator.sol';
import '@uniswap/v2-periphery/contracts/libraries/UniswapV2Library.sol';
import '@uniswap/v2-core/contracts/interfaces/IUniswapV2Pair.sol';



contract LiquidityValueCalculator is ILiquidityValueCalculator {
    address public factory;
    constructor(address factory_) public {
        factory = factory_;
    }

    function PairInfo(address tokenA, address tokenB) internal view returns(uint256 ReverseA,uint256 ReverseB,uint256 TotalSupply){
        address pair = UniswapV2Library.pairFor(factory, tokenA, tokenB);
        IUniswapV2Pair Pair = IUniswapV2Pair(pair);
        (uint256 Reverse0,uint256 Reverse1,) = Pair.getReserves();
        ReverseA = Reverse0;
        ReverseB = Reverse1;
        TotalSupply = Pair.totalSupply();
    }

}
