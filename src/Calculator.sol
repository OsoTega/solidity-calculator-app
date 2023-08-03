//SPDX-License-Identifier: MIT

/*
 * @title Calculator Solidity App.
 * @author Tega Osowa <https://tega-osowa-portfolio.netlify.app/>
 *
 * @dev This is a simple calculator application that can be used to perform simple
 *      and moderate arithmetic expressions. This calculator is meant to be deployed
 *      on the block chain, and save whatever the user has calculated on the block chain.
 *      The calculator works by using a package called `eval-utils-lib`. This package has
 *      a function called evaluate, which takes in an arithmetic string, computes it and
 *      returns a uint256 as the result. This calculator uses the library to calculate
 *      the expression provided by the user.
 *
 *      The gas cost for implementing various operations would definitely defer,
 *      depending on the size and length of the string being processed. For large strings,
 *      pre-processing is advised, so as to reduce the gas cost. It is
 *      advised to be used wisely, preferably on smaller strings.
 *      All functions are written with simplicity in mind, and should be easy to use and
 *      implement, please feel free to make any request or update for request to me,
 *      it's still a work in progress, and this contribution is important to the Web3 Community.
 *      Code Away
 */

pragma solidity ^0.8.18;

import {EvalUtils} from "eval-utils-lib/EvalUtils.sol";

contract Calculator {
    struct UserCalculations {
        uint256 recentCalculation;
        uint256[] calculationResultHistory;
        string[] calculationHistory;
    }
    mapping(address => UserCalculations) public calculations;

    function calculate(string memory text) public {
        uint256 result = EvalUtils.evaluate(text);
        calculations[msg.sender].recentCalculation = result;
        calculations[msg.sender].calculationResultHistory.push(result);
        calculations[msg.sender].calculationHistory.push(text);
    }

    function getRecentCalculation() public view returns (uint256) {
        return calculations[msg.sender].recentCalculation;
    }

    function getCalculationHistory()
        public
        view
        returns (string[] memory, uint256[] memory)
    {
        return (
            calculations[msg.sender].calculationHistory,
            calculations[msg.sender].calculationResultHistory
        );
    }
}
