# Solidity Data Structures and Search Algorithms
This is a Solidity library framework that provides access to popular data structures and search algorithms. This framework can be used to implement efficient and scalable data storage and search functionalities in your Solidity smart contracts.

## Available Data Structures
The following data structures are currently available in this framework:

Linked List
Stack
Queue
Binary Tree
Binary Search Tree
Heap
Hashing
Graph
Matrix
Available Search Algorithms

### The following search algorithms are currently available in this framework:

Linear Search
Binary Search
Depth First Search
Breadth First Search

## How to Use
To use this framework in your Solidity smart contracts, you can import the relevant library for the data structure or search algorithm that you want to use. For example, to use the Binary Search Tree library, you would import it like this:

```solidity
import "@sdsa-libraries/binary-search-tree.sol";

contract MyContract {
    using LinkedList for LinkedList.List;
    LinkedList.List myList;

    function doSomething() public {
        // Initialize the linked list
        myList.initialize();

        // Add some values to the list
        myList.append(1);
        myList.append(2);
        myList.append(3);

        // Remove a value from the list
        myList.remove(2);

        // Add a value to the front of the list
        myList.prepend(0);
    }
}
```

License
This library is licensed under the MIT License. See the LICENSE file for more information.