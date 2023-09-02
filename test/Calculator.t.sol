// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.19;

import "../Calculator.sol";

contract Test {
    event log(string);
    event log_named_uint(string key, uint256 val);
    event log_named_string(string key, string val);

    bool private _failed;

    address constant HEVM_ADDRESS = address(bytes20(uint160(uint256(keccak256("hevm cheat code")))));

    function fail() internal {
        if (hasHEVMContext()) {
            (bool status,) = HEVM_ADDRESS.call(
                abi.encodePacked(
                    bytes4(keccak256("store(address,bytes32,bytes32)")),
                    abi.encode(HEVM_ADDRESS, bytes32("failed"), bytes32(uint256(0x01)))
                )
            );
            status; // Silence compiler warnings
        }
        _failed = true;
    }

    function fail(string memory err) internal {
        emit log_named_string("Error", err);
        fail();
    }

    function hasHEVMContext() internal view returns (bool) {
        uint256 hevmCodeSize = 0;
        assembly {
            hevmCodeSize := extcodesize(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D)
        }
        return hevmCodeSize > 0;
    }

    function assertEq(uint256 a, uint256 b) internal {
        if (a != b) {
            emit log("Error: a == b not satisfied [uint]");
            emit log_named_uint("      Left", a);
            emit log_named_uint("     Right", b);
            fail();
        }
    }

    function assertEq(uint256 a, uint256 b, string memory err) internal {
        if (a != b) {
            emit log_named_string("Error", err);
            assertEq(a, b);
        }
    }

    function assertEq(string memory a, string memory b) internal {
        if (keccak256(abi.encodePacked(a)) != keccak256(abi.encodePacked(b))) {
            emit log("Error: a == b not satisfied [string]");
            emit log_named_string("      Left", a);
            emit log_named_string("     Right", b);
            fail();
        }
    }

    function assertEq(string memory a, string memory b, string memory err) internal {
        if (keccak256(abi.encodePacked(a)) != keccak256(abi.encodePacked(b))) {
            emit log_named_string("Error", err);
            assertEq(a, b);
        }
    }
}

contract CalculatorTest is Test {
    Calculator immutable calculator = new Calculator();

    function setup() public payable {}

    function testAdd() public payable {
        assertEq(calculator.add(3, 2), 5, "Addition test failed");
    }

    function testSubtract() public payable {
        assertEq(calculator.subtract(5, 3), 2, "Subtraction test failed");
    }

    function testMultiply() public payable {
        assertEq(calculator.multiply(3, 4), 12, "Multiplication test failed");
    }

    function testDivide() public payable {
        assertEq(calculator.divide(8, 4), 2, "Division test failed");
    }

    function testFailDivideByZero() public {
        try calculator.divide(1, 0) {
            fail("Division or modulo by 0");
        } catch Error(string memory reason) {
            assertEq(reason, "Division or modulo by 0", "Unexpected revert reason");
        }
    }

    function testModulo() public payable {
        assertEq(calculator.modulo(10, 3), 1, "Modulo test failed");
    }

    function testFailModuloByZero() public {
        try calculator.modulo(1, 0) {
            fail("Division or modulo by 0");
        } catch Error(string memory reason) {
            assertEq(reason, "Division or modulo by 0", "Unexpected revert reason");
        }
    }

    function testPower() public payable {
        assertEq(calculator.power(2, 3), 8, "Power test failed");
    }
}
