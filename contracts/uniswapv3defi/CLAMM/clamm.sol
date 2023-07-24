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
        uint160 sqrtPriceX96;
        int24 tick;
       
        bool unlocked;
    }
Slot0 public slot0;

event initialized(uint160 sqrtPriceX96, int24 tick);
function initialize(uint160 sqrtPriceX96) external {
    require(slot0.sqrtPriceX96 == 0, 'ALREADY_INITIALIZED');


slot0 = Slot0({
        sqrtPriceX96: sqrtPriceX96,
        tick: TickMath.getTickAtSqrtRatio(sqrtPriceX96),
        unlocked: true
    });

emit initialized(sqrtPriceX96, slot0.tick);


    



}



   

    
}