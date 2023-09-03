// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.19;

/// @notice Calculator for basic arithmetic operations including negatives.
/// @dev Safe arithmetic via Solidity-native overflow/underflow protection.
contract Calculator {
    function add(int256 x, int256 y) public pure returns (int256) {
        return x + y;
    }

    function subtract(int256 x, int256 y) public pure returns (int256) {
        return x - y;
    }

    function multiply(int256 x, int256 y) public pure returns (int256) {
        return x * y;
    }

    function divide(int256 x, int256 y) public pure returns (int256) {
        return x / y;
    }

    function modulo(int256 x, int256 y) public pure returns (int256) {
        return x % y;
    }

    function power(uint256 base, uint256 exponent) public pure returns (uint256) {
        return base ** exponent;
    }

    function calculate(
        int256 x, 
        int256[] calldata y, 
        function(int256, int256) external pure returns (int256)[] calldata op) 
    public pure returns (int256 z) {
        unchecked {
            require(y.length == op.length, "Arrays must be of equal length");
            z = x;
            for (uint256 i; i < y.length; ++i) z = op[i](z, y[i]);
        }
    }
}
