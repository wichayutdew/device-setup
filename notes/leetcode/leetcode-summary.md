> All space complexities will disregard the size of result since it's unaviodable

# Easy

| Question | DSA/Algo | Summary | Time | Space |
| --- | --- | --- | --- | --- |
| Two Sum | Map | store (remaining for target -> idx) while also loop thru the input | O(n) | O(n) |
| Valid Parentheses | Stack | push matching closing bracket into stack if opening is found, then keeps popping it out and see if closing one match. lastly check if stack is empty | O(n) | O(n) |
| Merge two Sorted Lists | LinkedList | create new temp linked list and keeps pointer for all 3 ListNodes, keep iterate and fill lower value into result list until one of the pointer is null, then connect the remaining linkedlist to a result list | O(n) | O(1) |
| Best time to buy and sell stock | Array | create 2 variable to keep track of min price and profit, keeps updating the value while looping thru all the stock price and return the best profit | O(n) | O(1) |

# Medium
| Question | DSA/Algo | Summary | Time | Space |
| --- | --- | --- | --- | --- |
| Maximum Subarray | Array - Kadane's Algorithm | keep 2 variable curSum and maxSum, on every traverse curSum get added (it first get reset to 0 if negative), maxSum starts with min value in case the best sum we can do is negative. after we know curSum, we see if it's better than previous maxSum we have | O(n) | O(n) |
| Insert Interval | Array | 3 steps. 1 add what ever in intervals to result if intervals[1] < newInterval[0], 2. merge overlapping interval while looping until interval[0] larger than that merged interval, 3. add what remains in intervals to result | O(n) | O(1) |
| 01 Matrix | Matrix | 2 pass, from top-left then from bottom-right. each pass only process the cell != 0. by taking min of either top/left cell + 1, (same goes for bottom/right pass but on this pass we might already have closest value already so compare that too). if cannot find either of the top/left/bottom/right, we default that value to possibly the farthest we can do which is rows+cols. | O(m*n) | O(1) |
| K Closest point to origin | Heap | can do both min/maxHeap, minHeap: heapify the list and poll only closest k value. maxHeap: keeps offering each element until reach k then poll the big one out | minHeap: O(n + klog(n)) maxHeap: O(nlog(k)) | minHeap: O(n), maxHeap: O(k) |
| Longest substring without repeating character | Array - Sliding windows | traverse until end pointer reaches end while use set to check for duplicate and have 1 variable to keep track of longest non dupe length, but before doing all that make sure there's no dupe by removing all dupe char in set by incrementing start pointer | O(n) | O(1) |
| 3Sum | Array - Two pointer | nested 2 pointer (loop from 1st index until we can't do 3 sum) in each iteration do 2 pointer from left and right pointer and closing down the gap. if the sum is 0 add to result set (since we don't want dupe) then return that result (before doing all this we need to sort the input so 2 pointer works) | O(n^2) | O(1) |
| Binary tree level order traversal | Tree | create helper function to accept node and level, if level match create empty list and add that node's value in to that level's list then recursively call to left and right node respective | O(h) {height of tree} | O(1) |
| Clone graph | Graph - DFS | DFS the graph while keep updating the map of (origin->clone node). in dfs treat the map as visited list, if exists return node previously cloned, else clone the node and traverse thru each neighbors and do DFS recursively | O(v+e) {node(vertice) + neigbors(edges)} | O(v+e) |
| Evaluate reverse polist notation | Stack | input is valid order so just do simple stack to keep appending number, once math sign is found pop last 2 numbers to do math and push it back. lastly pop the result | O(n) | O(n) |
| Course schedule | Graph - DFS | go thru prerequisite list and create map of (course->prereq list) then create DFS helper to try to run the course if it can be finished by the prereq list (think of it as neighbor map since we need to also check if each prereq course can be finished). then run thru all courses if any stuck at studying stage then we cannot complete all course, return true otherwise | O(v+e) | O(v+e) |
| Coin change | DP - Memoization | store least coin uses for each total amount (default it at MAX) baseline is 0. loop per coin type, idea is to check for each amount if this exact coin type will help reduce the total number of coins needed. | O(coins size * amount) | O(amount) |
| Product of array except self | Array | 2 pass, 1 pass will do multiply on left side of index, 2nd pass do right side. with help of sum variable(reset each pass) | O(n) | O(1) |
| Min Stack | LinkedList | create new linked list to help store node linkage and for each node always keep min value, when pop just move the head to next node(to replicate stack pop) | O(1) | O(n) {n == number of push in test case} |
| Validate Binary Search Tree | Tree | create helper function to collect node, and lower/upper bound of what value should be (in Long to prevent overflow) and tree traversal to check if entire tree is in bound | O(h) | O(1) |
| Number of Island | Matrix - DFS | traverse matrix and increment count if 1 found, then drown that island with DFS | O(row * col) | O(1) |
| Rotting Oranges | Matrix -DFS | 2 pass, 1st do DFS to rot all other adjacent cells, then find max minutes but if fresh orange is found return -1 (caveat, we need to -2 minutes from result in cell since we will start from 2 and increment the minutes from there) | O(row*col) | O(1) |

