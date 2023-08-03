//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {Calculator} from "../src/Calculator.sol";

contract DeployCalculator is Script {
    function run() public returns (Calculator) {
        vm.startBroadcast();
        Calculator calculator = new Calculator();
        vm.stopBroadcast();
        return calculator;
    }
}
