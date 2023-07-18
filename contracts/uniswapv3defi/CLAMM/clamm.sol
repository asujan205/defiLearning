// SPDX-License-Identifier: GPL-2.0-or-later

// this smart contract is similar to the core contract of uniswap v3 for learning propodrf only 
pragma solidity ^0.8.19;
import "./library/Tick.sol";


contract CLAMM {

    address  public immutable token0;
    address public immutable token1;
  address public  immutable factory;
    uint24 public  immutable fee;
    int24 public immutable tickSpacing;
    uint128 public immutable maxLiquidityPerTick;
    

    constructor (

        address _factory,
        address _token0,
        address _token1,
        uint24 _fee,
        int24 _tickSpacing
    ) {
        factory = _factory;
        token0 = _token0;
        token1 = _token1;
        fee = _fee;
        tickSpacing = _tickSpacing;

        maxLiquidityPerTick = Tick.tickSpacingToMaxLiquidityPerTick(_tickSpacing);
        

        


    }

 struct Slot0 {
        // the current price
        uint160 sqrtPriceX96;
        // the current tick
        int24 tick;
        // the most-recently updated index of the observations array
        uint16 observationIndex;
        // the current maximum number of observations that are being stored
        uint16 observationCardinality;
        // the next maximum number of observations to store, triggered in observations.write
        uint16 observationCardinalityNext;
        // the current protocol fee as a percentage of the swap fee taken on withdrawal
        // represented as an integer denominator (1/x)%
        uint8 feeProtocol;
        // whether the pool is locked
        bool unlocked;
    }
    
function initialize(uint160 sqrtPriceX96) external {



}



   

    
}