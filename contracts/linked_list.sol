// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LinkedList {
    struct Node {
        uint256 value;
        uint256 next;
    }

    struct List {
        uint256 head;
        uint256 tail;
        mapping(uint256 => Node) nodes;
    }

    function initialize(List storage self) internal {
        self.head = 0;
        self.tail = 0;
    }

    function isEmpty(List storage self) internal view returns (bool) {
        return self.head == 0;
    }

    function append(List storage self, uint256 value) internal {
        Node storage node = self.nodes[self.tail];
        node.value = value;
        node.next = ++self.tail;
        self.nodes[self.tail] = Node(0, 0);
        if (self.head == 0) {
            self.head = 1;
        }
    }

    function prepend(List storage self, uint256 value) internal {
        if (isEmpty(self)) {
            append(self, value);
        } else {
            Node storage node = self.nodes[++self.head];
            node.value = value;
            node.next = self.head + 1;
            self.nodes[self.head + 1] = self.nodes[self.head];
            self.nodes[self.head] = node;
        }
    }

    function remove(List storage self, uint256 value) internal returns (bool) {
        if (isEmpty(self)) {
            return false;
        }

        if (self.nodes[self.head].value == value) {
            self.head = self.nodes[self.head].next;
            return true;
        }

        uint256 i = self.head;
        while (self.nodes[i].next != 0) {
            if (self.nodes[self.nodes[i].next].value == value) {
                self.nodes[i].next = self.nodes[self.nodes[i].next].next;
                if (self.nodes[i].next == 0) {
                    self.tail = i;
                }
                return true;
            }
            i = self.nodes[i].next;
        }

        return false;
    }
}
