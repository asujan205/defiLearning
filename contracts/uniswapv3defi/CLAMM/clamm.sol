// SPDX-License-Identifier: GPL-2.0-or-later

// this smart contract is similar to the core contract of uniswap v3 for learning propodrf only 
pragma solidity ^0.8.19;


contract CLAMM {

    address  public immutable token0;
    address public immutable token1;
  address public  immutable factory;
    uint24 public  immutable fee;
    int24 public immutable tickSpacing;

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
    }



   

    
}