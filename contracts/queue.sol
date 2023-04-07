// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Queue {
    struct Data {
        uint256[] elements;
        uint256 front;
        uint256 rear;
    }

    function initialize(Data storage self) internal {
        self.elements = new uint256[](0);
        self.front = 0;
        self.rear = 0;
    }

    function isEmpty(Data storage self) internal view returns (bool) {
        return self.front == self.rear;
    }

    function enqueue(Data storage self, uint256 value) internal {
        self.elements.push(value);
        self.rear += 1;
    }

    function dequeue(Data storage self) internal returns (uint256) {
        require(!isEmpty(self), "Queue is empty");
        uint256 value = self.elements[self.front];
        delete self.elements[self.front];
        self.front += 1;
        return value;
    }

    function front(Data storage self) internal view returns (uint256) {
        require(!isEmpty(self), "Queue is empty");
        return self.elements[self.front];
    }
}
