//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployCalculator} from "../script/DeployCalculator.s.sol";
import {Calculator} from "../src/Calculator.sol";

contract CalculatorTest is Test {
    Calculator calculator;
    address USER = makeAddr("user");
    uint256 constant SEND_VALUE = 0.1 ether;
    uint256 constant STARTING_BALANCE = 10 ether;
    uint256 constant GAS_PRICE = 1;

    function setUp() external {
        DeployCalculator deployCalculator = new DeployCalculator();
        calculator = deployCalculator.run();
    }

    function testCanCalculate() public {
        vm.prank(USER);
        calculator.calculate("(1+1)+4/2");
        vm.prank(USER);
        uint256 recentCalculate = calculator.getRecentCalculation();
        console.log(recentCalculate);
        assertEq(recentCalculate, 4);
    }

    function testCanGetRecentCalculation() public {
        vm.prank(USER);
        uint256 recentCalculate = calculator.getRecentCalculation();
        console.log(recentCalculate);
        assertEq(recentCalculate, 0);
    }

    function testCanGetHistoryCalculation() public {
        vm.prank(USER);
        (
            string[] memory recentStringCalculate,
            uint256[] memory recentCalculate
        ) = calculator.getCalculationHistory();
        assertEq(recentCalculate.length, 0);
    }

    function testCalculationHistory() public {
        for (uint256 i = 0; i < 10; i++) {
            vm.prank(USER);
            calculator.calculate("(1+1)+4/2");
        }

        vm.prank(USER);
        uint256 recentCalculate = calculator.getRecentCalculation();
        console.log(recentCalculate);
        assertEq(recentCalculate, 4);

        vm.prank(USER);
        (
            string[] memory recentStringCalculateList,
            uint256[] memory recentCalculateList
        ) = calculator.getCalculationHistory();
        assertEq(recentCalculateList.length, 10);
        assertEq(recentStringCalculateList.length, 10);
    }
}
