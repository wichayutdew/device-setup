> All space complexities will disregard the size of result since it's unaviodable

# Easy

| Question | DSA/Algo | Summary | Time | Space |
| --- | --- | --- | --- | --- |
| Two Sum | Map | store (remaining for target -> idx) while also loop thru the input | O(n) | O(n) |
| Valid Parentheses | Stack | push matching closing bracket into stack if opening is found, then keeps popping it out and see if closing one match. lastly check if stack is empty | O(n) | O(n) |
| Merge two Sorted Lists | LinkedList | create new temp linked list and keeps pointer for all 3 ListNodes, keep iterate and fill lower value into result list until one of the pointer is null, then connect the remaining linkedlist to a result list | O(n) | O(1) |
| Best time to buy and sell stock | Array | create 2 variable to keep track of min price and profit, keeps updating the value while looping thru all the stock price and return the best profit | O(n) | O(1) |


