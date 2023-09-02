// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.19;

/// @title Calculator
/// @dev Simple trustless calculator via Solidity arithmetic operators.
contract Calculator {
    /// @notice Add two numbers.
    /// @param a The first number.
    /// @param b The second number.
    /// @return The sum of a and b.
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    /// @notice Subtract one number from another.
    /// @param a The number to subtract from.
    /// @param b The number to subtract.
    /// @return The difference of a and b.
    function subtract(uint256 a, uint256 b) public pure returns (uint256) {
        return a - b;
    }

    /// @notice Multiply two numbers.
    /// @param a The first number.
    /// @param b The second number.
    /// @return The product of a and b.
    function multiply(uint256 a, uint256 b) public pure returns (uint256) {
        return a * b;
    }

    /// @notice Divide one number by another.
    /// @param a The dividend.
    /// @param b The divisor.
    /// @return The quotient of a divided by b.
    function divide(uint256 a, uint256 b) public pure returns (uint256) {
        return a / b;
    }

    /// @notice Find the remainder after dividing one number by another.
    /// @param a The dividend.
    /// @param b The divisor.
    /// @return The remainder of a modulo b.
    function modulo(uint256 a, uint256 b) public pure returns (uint256) {
        return a % b;
    }

    /// @notice Raise a number to a power.
    /// @param base The base number.
    /// @param exponent The exponent to raise the base to.
    /// @return The value of base raised to the power exponent.
    function power(uint256 base, uint256 exponent) public pure returns (uint256) {
        return base ** exponent;
    }
}
