> All space complexities will disregard the size of result since it's unaviodable

# Easy

| Question | DSA/Algo | Summary | Time | Space |
| --- | --- | --- | --- | --- |
| Two Sum | Map | store (remaining for target -> idx) while also loop thru the input | O(n) | O(n) |
| Valid Parentheses | Stack | push matching closing bracket into stack if opening is found, then keeps popping it out and see if closing one match. lastly check if stack is empty | O(n) | O(n) |
| Merge two Sorted Lists | LinkedList | create new temp linked list and keeps pointer for all 3 ListNodes, keep iterate and fill lower value into result list until one of the pointer is null, then connect the remaining linkedlist to a result list | O(n) | O(1) |
| Best time to buy and sell stock | Array | create 2 variable to keep track of min price and profit, keeps updating the value while looping thru all the stock price and return the best profit | O(n) | O(1) |
| Valid Palindrome | String - Two pointer | skip empty char and non english character by `.isLetterOrDigit()` then compare each pointer in lower case | O(n) | O(n) |
| Invert Binary tree | Tree - recursion | swap left/right child and do recursion to left/right with same method | O(h) | O(1) |
| Valid anagram | String | use map to store (char->occurance) of 1st string and reduce it from 2nd string then see if the map is empty | O(n) | O(n) |
| Binary search | Binary search | two pointer while loop l<=r each round find mid point by `l + (r-l)/2` check if it equals to target otherwise move left/right pointer accordingly (only applicable to sorted array) | O(logn) | O(1) |
| Flood Fill | Matrix - DFS | start from defined source and do DFS to change color to target color | O(m*n) {all cell visited once} | O(m*n) {size of each cell visit due to recursion stack} |
| LCA of BST | Tree | Recursion call to check each node in the tree, if node value is in the midle between p and q then that's the LCA, go left if node value is too big, otherwise go right | O(h) | O(h) {recursion stack} |
| Balanced Binary Tree | Tree | Extended version of tree height question, create get height helper method while also keeps checking if left height - right heigt diff greater than 1 if that happens terminate the session by returning -1 to signal top recursion call that it's not balanced | O(h) | O(h) {recursion stack} |
| Linked list cycle | Linked List | slow/fast pointer, keep incrementing both pointer until it point to the same node, otherwise fast pointer will reach the end | O(n) | O(1) |
| Implement queue using stack | Stack | using 2 stack to achieve this. called in/out stack. when push to queue add to inStack, if pop/peek transfer everything from inStack to outStack then do pop/peek | push:O(1) pop/peek:O(n) empty:O(1) | O(n) |
| First bad version | Binary Search | one variant of binary search, start from 2 pointer l/r each iteration find mid. if mid is bad, there might be some bad version on the left, so put right pointer to that mid point, else put left pointer next to mid since we cannot have first bad version before that (l<r to prevent infinite loop) | O(logn) | O(1) |
| Ransom note | String | put character in magazine into map, then try to build the note, if char not found in map the cannot create else can | O(n) | O(n) |
| Climing Stairs | DP | using memoization array to find the result of n, we know that dp[1] and dp[2] is 1 and 2, then we can use that information to compile dp[3] onwards | O(n) {since we can reduce the recursion step using array so ultimately we do just 1 for loop} | O(n) |
| Longest Palindrome | String | use set to store dupe, since the idea of palindrome is to use 2 char on each side and +1 if we can have another single character in the middle | O(n) | O(n) |
| Reverse Linked List | Linked List | create dummy head node with null (and prev iterator) then loop thru the node in original list, then point the current node to prev and move both to right node | O(n) | O(1) |
| Majority element | Array | Use checker pointer and counter, loop thru the array keep increment(if == checker value)/decrement counter, reset the checker if counter reaches 0, return the last checker (idea is because if checker can out live any other value then it's the one appear more frequent) | O(n) | O(1) |
| Add Binary | String | start from last char of both string, have 1 variable to store if we need to carry the value e.g. 1+1=0 (then we need to carry the 1 to the previous index) since binary is base 2 then to sum both number we need to do x%2 and carry we can do x/2 | O(n) | O(1) |
| Diameter of Binary tree | Tree | another variant of get tree height question, just create another global variable to keep track longest lenght from left to right node (sum of left/right height) | O(h) | O(1) |
| Middle of the Linked List | Linked List | slow/fast pointer, while iterating keep check if next node of fast pointer is null then return slow node | O(n) | O(1) |
| Maximum Depth of Binary Tree | Tree | get height of the tree by return 0 if it's null then do recursive call to max of left/right child height + 1 (the node itselves) | O(h) | O(h) |
| Contains Duplicate | Array | use set to store the number for each iteration, return true if we encounter same value in set, false otherwise | O(n) | O(n) |
| Roman to Integer | String | keep going thru each character while also have another variable to store next char cause in roman numeral we have a rules e.g. IV = 4, IX = 9. we keep checking the numeral and increment/decrement(if meet criteria) then return the sum of that result | O(n) | O(1) |
| Integer to Roman | String | create pair of (value-> roman numeral) from 1000>>1 (with 900,400,90,40,9,4) included as well, then loop thru that list of pairs, while trying to reduce the input number, and add that roman numeral into string builder | O(13*n) {13 possible roman numeral * max number of times we can add that numeral in} | O(1) |
| Backspace string compare | Stack | create helper function to do backspace action using stack, if # found and stack is not empty then pop out, check if both stack size are equal, then compare character by character if it's matched | O(n) | O(n) |
| Same tree | Tree | compare node value (then recursively call to left/right child) | O(h) | O(h) |
| Longest Common Prefix | Array | use 1st element in array as a baseline, keep checking for each character in each elements in list if the any of it doesn't matched then return substring of 1st string up until that previous index, otherwise that 1st string will be the longest common prefix | O(m*n) {size of 1st string * size of elements list} | O(1) |
| Palindrome Linked List | Linked List | use slow/fast pointer to split the middle then reverse 2nd half and keep compare node by node til 2nd half reaches null | O(n) | O(1) |
| Move Zeroes | Array | keep one pointer and only moves if we assign non zero into index, then keep adding zero until last index | O(n) | O(1) |
| Symmetric Tree | Tree | create helper to accept 2 node and check if it's similar, then recursive traversal for mirror check e.g. left.left==right.right, left.right==right.left | O(h) | O(h) {recursive stack} |
| Missing Number | Math | question state that input is 0->n so we can use math to solve cause sum of 0->n is n*(n+1)/2, then we just sum input array and return difference between math result and actual sum | O(n) {.sum() takes n} | O(1) |
| Palindrome number | Math | (default case, if negative non palindrome, 0>9 palindrome, divisible by 10 non palindrome) try to use math to split number into 2 half e.g. num2 = num2*10 + num1%10 then num1 /= 10, keep doing this til num1 < num2, num2 will be the one with possibly the longer side (odd palindrome) so we need to check whether num1 == num2 or num1 == num2/10 | O(n) | O(1) |
| Convert sorted array to binary tree | Binary Search | similar idea to binary search, create helper method to accept left,rignt pointer to array, then find mid point and keep recursively call same method to build left and right child | O(logn) | O(1) |
| Subtree of Another tree | Tree | create helper method to receive 2 node and keep comparing each node and recursively check left/right child as well, then we keep check for the entire tree if we can find exact similar anywhere in the tree that looks like subTree or not | O(h) | O(1) |
| Squares of Sorted Array | Array - Two pointer | do two pointer left and right and keep adding square of bigger number to the last position of new array, then keep minimizing the window until left/right pointer touch (or new array size is equals to original array) | O(n) | O(1) |

