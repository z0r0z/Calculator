// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.19;

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

    function power(int256 base, uint8 exponent) public pure returns (int256) {
        return base < 0 ? exponent % 2 == 0 ? int(uint(-base) ** exponent) :
                -(int(uint(base) ** exponent)) : 
                    int(uint(base) ** exponent);
    }

    function calculate(
        int256 x, 
        int256[] calldata y, 
        function(int256, int256) external pure returns (int256)[] calldata op) 
    public pure returns (int256 z) {
        unchecked {
            require(y.length == op.length, "Arrays not equal");
            z = x;
            for (uint256 i; i < y.length; ++i) z = op[i](z, y[i]);
        }
    }
}
