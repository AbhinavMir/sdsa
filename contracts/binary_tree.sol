// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library BinaryTree {
    struct Node {
        uint256 value;
        uint256 left;
        uint256 right;
    }

    struct Tree {
        uint256 root;
        mapping(uint256 => Node) nodes;
    }

    function initialize(Tree storage self) internal {
        self.root = 0;
    }

    function isEmpty(Tree storage self) internal view returns (bool) {
        return self.root == 0;
    }

    function insert(Tree storage self, uint256 value) internal {
        if (isEmpty(self)) {
            self.nodes[1] = Node(value, 0, 0);
            self.root = 1;
        } else {
            uint256 i = self.root;
            while (i != 0) {
                if (value < self.nodes[i].value) {
                    if (self.nodes[i].left == 0) {
                        // TODO: this isn't correct, fix it
                        self.nodes[i].left = ++self.nodesCount;
                        self.nodes[self.nodesCount] = Node(value, 0, 0);
                        break;
                    }
                    i = self.nodes[i].left;
                } else {
                    if (self.nodes[i].right == 0) {
                        self.nodes[i].right = ++self.nodesCount;
                        self.nodes[self.nodesCount] = Node(value, 0, 0);
                        break;
                    }
                    i = self.nodes[i].right;
                }
            }
        }
    }

    function search(Tree storage self, uint256 value) internal view returns (bool) {
        uint256 i = self.root;
        while (i != 0) {
            if (value == self.nodes[i].value) {
                return true;
            } else if (value < self.nodes[i].value) {
                i = self.nodes[i].left;
            } else {
                i = self.nodes[i].right;
            }
        }
        return false;
    }

    function traverseInOrder(Tree storage self, uint256 i, uint256[] storage result) internal {
        if (i != 0) {
            traverseInOrder(self, self.nodes[i].left, result);
            result.push(self.nodes[i].value);
            traverseInOrder(self, self.nodes[i].right, result);
        }
    }

    function traversePreOrder(Tree storage self, uint256 i, uint256[] storage result) internal {
        if (i != 0) {
            result.push(self.nodes[i].value);
            traversePreOrder(self, self.nodes[i].left, result);
            traversePreOrder(self, self.nodes[i].right, result);
        }
    }

    function traversePostOrder(Tree storage self, uint256 i, uint256[] storage result) internal {
        if (i != 0) {
            traversePostOrder(self, self.nodes[i].left, result);
            traversePostOrder(self, self.nodes[i].right, result);
            result.push(self.nodes[i].value);
        }
    }
}
