// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.19;

/// @notice Calculator for basic arithmetic operations.
/// @dev Simply uses only Solidity arithmetic operators.
contract Calculator {
    /// @notice Adds two numbers.
    /// @return The sum of `a` and `b`.
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    /// @notice Subtracts `b` from `a`.
    /// @return The difference between `a` and `b`.
    function subtract(uint256 a, uint256 b) public pure returns (uint256) {
        return a - b;
    }

    /// @notice Multiplies two numbers.
    /// @return The product of `a` and `b`.
    function multiply(uint256 a, uint256 b) public pure returns (uint256) {
        return a * b;
    }

    /// @notice Divides `a` by `b`.
    /// @return The quotient of `a` and `b`.
    function divide(uint256 a, uint256 b) public pure returns (uint256) {
        return a / b;
    }

    /// @notice Calculates the remainder of `a` divided by `b`.
    /// @return The remainder of `a` and `b`.
    function modulo(uint256 a, uint256 b) public pure returns (uint256) {
        return a % b;
    }

    /// @notice Raises `base` to the power of `exponent`.
    /// @return `base` raised to the `exponent`.
    function power(uint256 base, uint256 exponent) public pure returns (uint256) {
        return base ** exponent;
    }
}
