// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.6;


contract TWAP {

    struct Observation {
        uint timestamp;
        uint price;

    }
    Observation[] public _observation;
    uint public constant PERIOD = 1 minutes;
   function addObservation(uint256 timestamp, uint256 price) external {
        Observation memory newObservation = Observation(timestamp, price);
        _observation.push(newObservation);
    }


   function calculateTWAP(uint256 startTime, uint256 endTime) external view returns (uint256) {
        require(_observation.length > 0, "No observations found");

        uint256 numerator = 0;
        uint256 denominator = 0;

        for (uint256 i = 1; i < _observation.length; i++) {
            Observation memory prevObservation = _observation[i - 1];
            Observation memory currentObservation = _observation[i];

            if (prevObservation.timestamp >= startTime && currentObservation.timestamp <= endTime) {
                uint256 timeDifference = currentObservation.timestamp - prevObservation.timestamp;
                numerator += (prevObservation.price + currentObservation.price) / 2 * timeDifference;
                denominator += timeDifference;
            }
        }

        require(denominator > 0, "No observations found within the specified time range");

        return numerator / denominator;
    }









}