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
| Maximum Subarray | Kadane's algo | keep 2 variable curSum and maxSum, on every traverse curSum get added (it first get reset to 0 if negative), maxSum starts with min value in case the best sum we can do is negative. after we know curSum, we see if it's better than previous maxSum we have | O(n) | O(n) |
| Insert Interval | Array | 3 steps. 1 add what ever in intervals to result if intervals[1] < newInterval[0], 2. merge overlapping interval while looping until interval[0] larger than that merged interval, 3. add what remains in intervals to result | O(n) | O(1) |
| 01 Matrix | Matrix | 2 pass, from top-left then from bottom-right. each pass only process the cell != 0. by taking min of either top/left cell + 1, (same goes for bottom/right pass but on this pass we might already have closest value already so compare that too). if cannot find either of the top/left/bottom/right, we default that value to possibly the farthest we can do which is rows+cols. | O(m*n) | O(1) |
| K Closest point to origin | Heap | can do both min/maxHeap, minHeap: heapify the list and poll only closest k value. maxHeap: keeps offering each element until reach k then poll the big one out | minHeap: O(n + klog(n)) maxHeap: O(nlog(k)) | minHeap: O(n), maxHeap: O(k) |
| Longest substring without repeating character | Sliding windows | traverse until end pointer reaches end while use set to check for duplicate and have 1 variable to keep track of longest non dupe length, but before doing all that make sure there's no dupe by removing all dupe char in set by incrementing start pointer | O(n) | O(1) |
| 3Sum | two pointer | nested 2 pointer (loop from 1st index until we can't do 3 sum) in each iteration do 2 pointer from left and right pointer and closing down the gap. if the sum is 0 add to result set (since we don't want dupe) then return that result (before doing all this we need to sort the input so 2 pointer works) | O(n^2) | O(1) |

