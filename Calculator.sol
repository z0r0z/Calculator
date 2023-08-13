// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Calculator
 * @dev Provides basic arithmetic operations with safety checks.
 */
contract Calculator {
    /**
     * @notice Add two numbers.
     * @param a The first number.
     * @param b The second number.
     * @return result The sum of a and b.
     */
    function add(uint256 a, uint256 b) public pure returns (uint256 result) {
        assembly {
            result := add(a, b)
        }
    }

    /**
     * @notice Subtract one number from another. Reverts if the result would be negative.
     * @param a The number to subtract from.
     * @param b The number to subtract.
     * @return result The difference of a and b.
     */
    function subtract(uint256 a, uint256 b) public pure returns (uint256 result) {
        assembly {
            if gt(b, a) {
                let errorMsg := "Subtraction overflow"
                revert(add(errorMsg, 0x20), mload(errorMsg))
            }
            result := sub(a, b)
        }
    }

    /**
     * @notice Multiply two numbers.
     * @param a The first number.
     * @param b The second number.
     * @return result The product of a and b.
     */
    function multiply(uint256 a, uint256 b) public pure returns (uint256 result) {
        assembly {
            result := mul(a, b)
        }
    }

    /**
     * @notice Divide one number by another. Reverts if trying to divide by zero.
     * @param a The dividend.
     * @param b The divisor.
     * @return result The quotient of a divided by b.
     */
    function divide(uint256 a, uint256 b) public pure returns (uint256 result) {
        assembly {
            if iszero(b) {
                let errorMsg := "Division by zero"
                revert(add(errorMsg, 0x20), mload(errorMsg))
            }
            result := div(a, b)
        }
    }

    /**
     * @notice Find the remainder after dividing one number by another. Reverts if trying to modulo by zero.
     * @param a The dividend.
     * @param b The divisor.
     * @return result The remainder of a modulo b.
     */
    function modulo(uint256 a, uint256 b) public pure returns (uint256 result) {
        assembly {
            if iszero(b) {
                let errorMsg := "Modulo by zero"
                revert(add(errorMsg, 0x20), mload(errorMsg))
            }
            result := mod(a, b)
        }
    }

    /**
     * @notice Raise a number to a power.
     * @param base The base number.
     * @param exponent The exponent to raise the base to.
     * @return result The value of base raised to the power exponent.
     */
    function power(uint256 base, uint256 exponent) public pure returns (uint256 result) {
        assembly {
            result := 1
            if iszero(exponent) {
                // If exponent is 0, result remains 1
                return(0, 0)
            }

            for { } gt(exponent, 0) { exponent := shr(1, exponent) } {
                if and(exponent, 1) {
                    result := mul(result, base)
                }
                base := mul(base, base)
            }
        }
    }
}
