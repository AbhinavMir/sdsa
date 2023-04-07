// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Stack {
    struct Data {
        uint256[] elements;
    }

    function initialize(Data storage self) internal {
        self.elements = new uint256[](0);
    }

    function isEmpty(Data storage self) internal view returns (bool) {
        return self.elements.length == 0;
    }

    function push(Data storage self, uint256 value) internal {
        self.elements.push(value);
    }

    function pop(Data storage self) internal returns (uint256) {
        require(!isEmpty(self), "Stack is empty");
        uint256 value = self.elements[self.elements.length - 1];
        self.elements.pop();
        return value;
    }

    function top(Data storage self) internal view returns (uint256) {
        require(!isEmpty(self), "Stack is empty");
        return self.elements[self.elements.length - 1];
    }
}
