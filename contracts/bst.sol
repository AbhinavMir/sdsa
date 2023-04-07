// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library BinarySearchTree {
    struct Node {
        uint256 value;
        uint256 left;
        uint256 right;
        uint256 parent;
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
            self.nodes[1] = Node(value, 0, 0, 0);
            self.root = 1;
        } else {
            uint256 i = self.root;
            uint256 parent;
            while (i != 0) {
                parent = i;
                if (value < self.nodes[i].value) {
                    i = self.nodes[i].left;
                } else {
                    i = self.nodes[i].right;
                }
            }
            uint256 index = ++self.nodesCount;
            self.nodes[index] = Node(value, 0, 0, parent);
            if (value < self.nodes[parent].value) {
                self.nodes[parent].left = index;
            } else {
                self.nodes[parent].right = index;
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

    function minimum(Tree storage self, uint256 i) internal view returns (uint256) {
        while (self.nodes[i].left != 0) {
            i = self.nodes[i].left;
        }
        return i;
    }

    function maximum(Tree storage self, uint256 i) internal view returns (uint256) {
        while (self.nodes[i].right != 0) {
            i = self.nodes[i].right;
        }
        return i;
    }

    function successor(Tree storage self, uint256 i) internal view returns (uint256) {
        if (self.nodes[i].right != 0) {
            return minimum(self, self.nodes[i].right);
        }
        uint256 parent = self.nodes[i].parent;
        while (parent != 0 && i == self.nodes[parent].right) {
            i = parent;
            parent = self.nodes[i].parent;
        }
        return parent;
    }

    function predecessor(Tree storage self, uint256 i) internal view returns (uint256) {
        if (self.nodes[i].left != 0) {
            return maximum(self, self.nodes[i].left);
        }
        uint256 parent = self.nodes[i].parent;
        while (parent != 0 && i == self.nodes[parent].left) {
            i = parent;
            parent = self.nodes[i].parent;
        }
        return parent;
    }
}
