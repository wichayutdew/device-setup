# Leetcode question cheatsheet

## Easy

### Two Sum

    _Default case_, if the array size is 1 or below, return empty `IntArray`

    **Solve**
        1. Use either `MutableMap` or normal `Array` to stored key = remainder,
           value = index
        2. For each value `num` in nums, check if `num` is of any key in
           `MutableMap`, if yes build `IntArray` of value of that map and
           current index
        3. Default case, return empty `IntArray`
    
    **Complexity** Time: O(n) Space: O(n)

### Valid Parentheses

    _Default case_, if input string trimmed is empty, return `True` 

    **Solve**
        1. Use Stack to collect opposite side of parentheses e.g. if found `(`
           then add `)` into stack
        2. If the character is not `[ { (`, then check if stack is empty or
           last value in stack doesn't match char, then it's not valid
        3. Last step, check if stack isEmpty, otherwise the string doesn't
           contains valid parentheses

    **Complexity** Time: O(n) Space: O(n)

### Merge Two Sorted Lists

    _Default case_, if both `LinkedList` are null, return null. Otherwise, if
    one of it is null, return other one 

    **Solve**
        1. create new variable to track head of new LinkedList, e.g. `val head:
           LinkList? = LinkList(0)`, this will be uses as temp head to return
           the result `LinkList`
        2. create variable temp to track from head created above, another
           iterator for list1 and list2 respectively
        3. do while loop when iterator for both list1 and list2 are not null,
           check value from each list, if it's less/equals add it into next
           node of temp. then move temp and iterator of that list forward
        4. after getting out of the loop, we will leave with 1 empty iterator,
           and another iterator with remaining nodes with value greater than
           the remaining iterator, then we can attach next node of temp to that
           iterator and return the node after head tracker created in step 1

    **Complexity** Time: O(n) Space: O(1) // exclude the result linklist

### Best time to buy and sell stock

    _Default case_, if prices array have 1 or less price then default to 0
    since we cannot buy and sell at the same day

    **Solve**
        1. Initiate new variable to keep track of min stock price and max
           profit
        2. for each price, try to check if it's the cheapest, if yes, assign it
           in min
        3. after that see if we buy on min date, and sell in this iteration,
           will we get better profit or not
        4. finally, we will have the best profit in `maxProfit variable`

    **Complexity** Time: O(n) Space: O(1) // static variable just change value

### Valid Palindrome

    _Default case_, check if input string trimmed is of length 1 or less, if
    yes then it's a palindrome

    **Solve**
        1. create variable left and right to keep track of index window in
           string
        2. do while loop l<r
            - in a while loop, do another while loop on both left and right
              side to skip any non letter or digit character by using
              `char.isLetterOrDigit()`
            - once we reach letter or digit char, the compare char on l and r
              pointer case insensitive using `char.lowercaseChar() or
              char.uppercaseChar()`, if it's not the same then it's not a
              palindrome
            - else keep increment l and decrement r
        3. finally if we are able to get out of while loop, the string itselves
        is palindrome extra: if we want to do functional way, we can also do
        filter function to cleanup any non letter or digit character and just
        do clean loop to compare. but it will take longer time since we need to
        go into a loop 2 times

    **Complexity** Time: O(n) // O(2n) if we do extra cleanup Space: O(1)

### Invert Binary Tree

    _Default case_, if root is null then just return root

    **Solve**
        1. For each node from root, swap left and right branch of it.
        2. then run the same function on left and right branch

    **Complexity** Time: O(h)  // h = height Space: O(1)

### Valid Anagram

    _Default case_, if 2 string doesn't have the same length then it's always
    false, and if one of the string is empty then it's always true since both
    string now should have same length

    **Solve**
        1. Use map to store key = character, value = occurance in first string
        2. loop through each character in second string, and reduce the number
        of occurance in first string, if occurance is <= 0 then remove that key
        from map
        3. if character is not in a map then it's not an anagram, then just
        return false
        4. lastly check if there's any remaining key inside map, if there is
        then it's not an anagram, otherwise it is

    **Complexity** Time: O(2n) // length of 2 input string Space: O(n) // keep
    track only 1 set of char and remove it out in 2nd pass

### Binary Search

    _Default case_, if nums is empty, then there's never a chance to match the
    target

    **Solve**
        1. create variable to track left and right window of sorted array,
        return -1
        2. while l <= r, find mid by `val mid = l + (r-l)/2`
        3. check if 
            - nums[mid] < target then left need to be after mid
            - nums[mid] > target then right need to be before mid
            - else -- we found the index of target
        4. if we can't find the target, then return -1

    **Complexity** Time: O(logn) // usual binary seach complexity Space: O(1)

### Flood fill

    _Default case_, if value at image[sr][sc] == color, there's nothing to do,
    return the image

    **Solve**
        1. create helper function to change image[row][col] = color but with
        default case of
            - row is not over bound
            - col is not over bound
            - image[row][col] == image[sr][sc]
            - image[row][col] != color
        2. for that helper function, also expand the fill to all 4 vertical
        indices
        3. In main function, just call this helper function once on
        image[sr][sc]
        4. return the fill image
        
    **Complexity** Time: O(m * n) // usual matrix complexity Space: O(1)

### Lowest Common Ancestor (LCA) of a Binary Search Tree

    _Default case_, if either of root, node p, or node q is null, then root is
    LCA of that tree

    **Solve**
        1. try to check if value at current root is greater than both value of
        node p and q, if yes, LCA should be at the left side of the tree
        2. check the same way but if value at root is lesser than both value of
        node p and q, then LCA needs to be right side of the tree
        3. otherwise, root is actually already a LCA of that tree

    **Complexity** Time: O(h) // h = height Space: O(1)

### Balanced Binary Tree

    _Default case_, if root is null, then tree is balanced

    **Solve**
        1. create helper function to calculate each node height while also keep
        checking if the height is balanced
            - default the helper function to return height of 0 if root is null
            - do loop call to calculate left and right height, since the return
              statement will be usual `return 1+maxOf(left height,right
              height)`
            - but this helper will have another condition to check if height of
              both side are balanced or not by checking if diff is > 1
            - if it's not balanced, then we return fallback value of -1
            - while calculating the left height and right height for each loop
              call, we also look for this fallback value, so we can just end
              the loop early if we know the tree is not balanced
        2. for main function, just validate that the result of helper function
        is not -1

    **Complexity** Time: O(h) // h = height Space: O(1)

### Linked list cycle

    _Default case_, check if current head and value next to head is null or
    not, if either of it is null then we would never have loop in that linked
    list 


    **Solve**
        1. using slow,fast pointer to determine if the linklist have a loop or
        not.
        2. do a while loop to keep checking if fast pointer is null or not,
        cause if it's null then there's no loop
        3. in a loop slow pointer move 1 node, fast pointer move 2 node, after
        move we check if both pointer point to the same node or not, if yes
        then this linklist do have a loop

    **Complexity** Time: O(n) Space: O(1)

### Implement Queue using Stack

    _Default case_, there is no default case, we just create a data class

    **Solve**
        1. create 2 stack called in and out stack. in uses to feed in all the
        value we got from push. out doing the completely opposite, to feed out
        anything we have in the queue
        2. push - just add the value into instack
        3. pop - to pop the value out, check if there's any outstanding item in
        outstack, if there is none, we move all the items from instack to
        outstack by push what ever pop from instack to outstack. after we move
        everything, check if we can pop anything from outstack, if there's none
        return fallback value -1, else pop the value out
        4. peek - do the same as pop, just change to peek in last step
        5. empty - to check if empty check if both stack are empty or not

    **Complexity** Time: O(n) // worst need to swap the entire stack to another
    stack Space: O(n)

### First bad version

    _Default case_, if there is only 1 version, check if it's bad, if not
    return default -1, if yes just return that version 1


    **Solve**
        1. using Binary Search style logic to keep finding mid index and check
        if it's bad.
        2. if mid is bad, then we can assume that there might possibly be some
        early version that is bad as well, so we move right window down
        3. if mid is not bad, then we move left window up cause we kinda
        confirm that there's no bad version before that
        4. keep repeating this process until l <= r
        5. return the left index since it's the actual first bad version

    **Complexity** Time: O(logn) Space: O(1)

### Ransom note

    _Default case_, if magazine is empty, then we would never create
    ransomnote, so it's false. otherway around if ransomNote is empty, then we
    don't need to build any then it's true

    **Solve**
        1. create map or array to keep track of number of usable character and
        it's occurance in magazine
        2. as we have list of available character, we can loop thru each
        character in ransomNote and keep deducting the usage from map (always
        remove the record if occurance is == 0 since there's no more available
        usage)
        3. some default case, if there's no character in map then ransomNote
        couldn't be created then we return false rigth away
        4. if we can loop the entire ransomNote that's mean we can create it,
        return true

    **Complexity** Time: O(2n) // worst if magazine and ransomNote size is the
    same Space: O(n) // size of magazine

### Climbing Stairs

    _Default case_, if n <= 2 we can just return n since that's all the
    possible ways we know
    
    **Solve**
        1. we will use Dynamic programming to solve this question.
        2. we know for a fact that n = 0 -> n = 2 we have n number of ways to
           climb stair, so we can just initiate dp array with that information
        3. for n = 3 onwards, we will use previous knowledge to solve meaning,
           for 3 we can just combine ways of climbing of n= 1 and n= 2. then
           going forward we can just redo this and get the result of n
           staircase

    **Compleity**: Time:O(n) Space:O(n)

### Longest Palindrome

    _Default case_, if the input string is length of 0 or 1 then it's
    automatically a palindrome

    **Solve**
        1. create 2 variables, 1 to keep track of number of palindrome length,
        another Set to keep track if we are able to create a palindrome char or
        not
        2. loop thru the entire string, if the character is not appear in set,
        then we add it in, once we found it's there in the set already, that's
        mean we have 1 palindrome character, then length of palindrome
        increases by 2 and we remove the character from set since it's getting
        matched already.
        3. after looping thru the entire string, we check lastly if there's any
        left over string in set, if there's at least 1, we can pick anything to
        put it in the middle to create odd palindrome, so add length +1,
        otherwise length stays the same

    **Complexity** Time: O(n) Space: O(n) // size of set

### Reverse linklist

    _Default case_, if the linklist is null or next is null then we cannot
    reverse any, just return the node

    **Solve**
        1. create prev node = null to keep track of node to be reversed to
        2. create iterator variable to keep moving right along the input node
        3. for each iteration until iterator points to null, keep track of
        right node, once we reverse the current node, the iterator should point
        to that right node
        4. to reverse the node, we point iterator.next to prev node, and move
        prev node to iterator
        5. then we can move iterator to right node.
        6. to return, we can just return prev, that's where new head is
        located.

    **Complexity** Time: O(n) Space: O(1) 

### Majority Element

    _Default case_, if the input array only have upto 2 records, we can just
    return index 0 as majority

    **Solve** Method1: slower
            1. calculate for threshold for majority by doing array.size/2
            2. create map to keep track of key=number,value=occurance of each
            number
            3. loop thru array and keep incrementing the map
            4. once the occurance of any value in the map exceed the threshold
            return that value
            5. if there's none, fallback to -1 Method2: faster
            1. create 2 variables to keep track of value checker (can default
            to value at index 0) and count of that value, starting from 0
            2. loop thru array, keep checking if count reach 0 we change
            checker to new value we are on in that index
            3. while value == checker we increment count else decrement it
            4. any value that can survive this process confirms to be the
            majority of the array
               
    **Complexity** Time: O(n) Space: O(n) method 1 / O(1) method 2 

### Add binary

    _Default case_, if both string are empty then return 0 or if one the binary
    string is empty return value of another string
    
    **Solve**
        1. start at the last character of each string. and create stringbuilder
        to keep track of result and carry variable if we need to carry the
        value over to next digit
        2. while both string still not reached index 0, calculate sum of each
        character + carry over. then append the sum%2 and update carry by sum/2
        3. try to check each string if there's still left over character and
        follow the same method as step 2 just don't need to sum it together
        4. one last step, always check if we have 1 carry left over to push
        into the result string builder
        5. reverse the string builder and create string result
               
    **Complexity** Time: O(n) Space: O(1) // exclde result string

### Diameter of Binary Tree

    _Default case_, if root is null, the diameter = 0 (diameter always doesn't
    count root node)


    **Solve**
        1. create global variable to keep track of longest diameter
        2. create helper function getHeight, but while getting the sum of left
        and rigth height always check if it's exceed longest variable
        3. then just return longest variable

    **Complexity** Time: O(h) // h = height Space: O(1)

### Middle of the Linked List

    _Default case_, if head is null , return null. if next is null, return head

    **Solve**
        1. use slow/fast pointer method to find the middle node
        2. loop until next node of fast pointer is null then return the slow
        pointer

    **Complexity** Time: O(n) Space: O(1)

### Maximum Depth of Binary tree

    _Default case_, if root is null then depth is 0

    **Solve**
        1. keep going down and get the longer height of left and right child
        2. return 1 + height of longer child, and it'll recursively return the
        correct maxDepth

    **Complexity** Time: O(h) Space: O(1)

### Contains Duplicate

    _Default case_, if array size is 1 or less then it's always false

    **Solve**
        1. use set to keep track of occurance
        2. loop thru the array and add value into set, if found same value from
        the set then return true since it's duplicated

    **Complexity** Time: O(n) Space: O(n) // worst case we add everything into
    the set and there's no duplicate

### Roman to Integer

    _Default case_, if input string is empty then return 0

    **Solve**
        1. loop thru each index of the string, at every index always check next
        character so we can do 4,9 calculation.
        2. create int variable to keep track of calculation
        3. do roman to int calculations for `I, IV, V, IX, X, XL, L, XC, C, CD,
        D, CM, M`
        4. for `I, X, C` also check for next char if we should do subtract from
        the 4,9 sign
        5. return the int result

    **Complexity** Time: O(n) Space: O(1)

### Integer to Roman

    _Default case_, if the input int is 0 then just return empty string

    **Solve**
        1. we need to create a list of pair of value to roman numeral sorted
           from biggest down to smallest e.g. 1000 -> M, 900 -> CM, ..., 1 -> I
        2. then we just follow each pair, try to decrease the input value as
           much as possible until we cannot decrease the value from that index,
           then we move to next index. in each iteration, just add the roman
           numeral to string builder.
        3. finally return the string we built

    **Complexity**: Time: O(n) Space:O(1)

### Backspace string compare

    _Default case_, there is no default case apart from actually clean both
    string once

    **Solve**
        1. create helper function to clean the string by using stack. loop thru
        each character in each string, if # found check if we can pop anything
        from stack, if yes pop it, otherwise just add character into the stack.
        then return the "said" stack out
        2. now we clean both string and will get 2 stack as a result, 1st step,
        check if both stack size is equal, otherwise it wouldn't be similar, if
        not equal the return false right away
        3. loop thru both stack and keep popping the latest value in stack, if
        latest value from 2 stacks aren't similar then just return false
        4. otherwise, we have the identical string after backspace, return true

    **Complexity** Time: O(3n) // 2 pass to clean string 1 pass to compare
    result Space: O(2n) // store 2 stack

### Same Tree

    _Default case_, if both p and q node are null, then it's same null tree.
    otherwise if p or q is null then it's not the same tree. lastly check if
    the node value is similar, if not return false


    **Solve**
        1. we based off the check from default case, then we just confirm that
        both left and right child of 2 tree are silimar and so on.

    **Complexity** Time: O(h) Space: O(1)

### Longest Common Prefix

    _Default case_, if array only have 1 string, then return length of that
    string.

    **Solve**
        1. we based off the 1st string in the array, and keeps checking if the
        character from other string in same index is the same as the one in 1st
        string. if yes, just keeps on the loop, else (or if any of the 2nd
        checker string reach it's length limit) we substring just up until that
        index
        2. once loop terminated, just return the 1st string, that's the longest
        we can do

    **Complexity** Time: O(n) // length of 1st string Space: O(n) // worst case
    it's as long as the 1st string

### Palindrome Linked List

    _Default case_, if linked list is null or next node is null, then itself is
    a palindrome

    **Solve**
        1. find middle of the linkedlist by slow/fast pointer
        2. once found reverse the 2nd half of the list
        3. after reverse, we start from from and back and traverse to middle
           node, if we found different value, return false
    **Complexity** Time: O(n) Space: O(1)

### Move Zeroes

    _Default case_, if the array size is 1 or less, just return, there's
    nothing to move

    **Solve**
        1. create pointer to keep track of index where we need to move non zero
        value to.
        2. loop along the array, if the value is not zero, then assign that
        value to the pointer and move pointer
        3. once finished, we can do another loop from pointer until end of
        array to assign zero in

    **Complexity** Time: O(n) Space: O(1)

### Symmetric Tree

    _Default case_, if the root is null then it's symmetric

    **Solve**
        1. create helper function to check for similarity just like the is same
        tree question
        2. but this time instead of check left with left and right with left,
        we check opposite, left with right and right with left
        3. then in core function just call this helper with left and right
        branch

    **Complexity** Time: O(h) Space: O(1)

### Missing Number
    **Solve**
        1. Need a bit of math to solve this. since we know the list size and
           constraint that in the list there should only be number 0..n (and
           missing 1 of the number)
        2. What we can do is use math operation `n * (n+1)/2` to find the
           expected sum in case we don't have any missing number and subtract
           by the actual sum in the input, that's the missing number

    **Complexity** Time:O(1) Space:O(1)

### Palindrome Number

    _Default case_, if x is negative or x is not 0 but %10 == 0, we can never
    build palindrome number since -ve sign, and e.g. 100,200,...

    **Solve**
        1. create reverse value of int just like what we do for some basic
           caculator question. crate some variable and do var = var*10 + x%10,
           then divide x by 10, keep doing this until x is less than that var
        2. then just verify if both int are equals (basically what we left is
           1st half and 2nd half(reversed) of int) or if the input is odd
           length we divide var by 10 (basically just dont care the middle
           value)

    **Complexity** Time: O(n) Space: O(1)

### Converted Sorted Array to Binary Search Tree

    _Default case_, the array size is 1, then build root from 1st index

    **Solve**
        1. create helper function which have logic like normal binary search,
           but the function accept left and right index of the array
        2. in the helper function, calculate for mid point, create tree node
           from that value in mid point, then call helper function to create
           left branch and right branch by splitting the left and right index
           from mid point

    **Complexity** Time: O(logn) Space: O(1)

### Sub tree of another tree

    _Default case_, if subRoot is null then it's always a subtree of any tree,
    otherwise if root is null, no subRoot can be found in the root

    **Solve**
        1. create helper function to check if 2 tree are similar, same logic as
           is same tree, keep checking if all nodes are having similar value
        2. in main function, keep check if root and subRoot are similar, if
           found any, return true.
        3. in the main function, we can always find both left and right branch
           if we have sub tree in the main tree or not

    **Complexity** Time: O(m*n) Space: O(m) // m is height of root, n is height
    of subRoot

### Squared of sorted array

    _Default case_, if the array is empty, do nothing

    **Solve**
        1. create new IntArray of same size as input, and initiate the iterator
           at last index
        2. since the input array is sorted, either the 1st or last value
           squared can be bigger. so we keep track of left and right index and
           compare the squared value, we put bigger value into new IntArray
           iterator, then append/decrease the pointer accordingly

    **Complexity** Time: O(n/2) Space: O(1) // not including result array

## Medium

### Maximum Subarray

    _Default case_ , if input array size is 1 or less just sum that.

    **Solve**
        1. This is example of kadane's algorithm. which needs us to store 2
           sum, current and total. current refresh everytime it is negative,
           total keeps checking whether to replace itself with current if
           current exceed the total
        2. so we start with total as 1st index and curren as 0. then we try to
           update current to exceed total while refreshing the sub array that
           is negative
        3. in each iteration, we check if current <0 then refresh current, then
           add number at index and compare if we should update total
        4. finally we can update total

    **Complexity** Time:O(n) Space:O(1)

### Insert Interval

    _Default case_, if newInterval is empty, there's nothing to add, if
    intervals is empty, just put newInterval as 1st interval in result

    **Solve**
        1. create iterator to keep track if interval to check, and new array
           list to keep track of result intervals
        2. split the insertion into 3 section (while always keep track that we
           are not out of bound of input intervals)
            - while intervals[i][1] < newInterval[0], just add existing
              interval(s) into new result since it's not merging point yet
            - while tempInterval[1] >= intervals[i][0], this is where we keep
              combining the newInterval with the existing interval(s). once we
              gone out of this loop, we can just append the tempInterval
            - while we have remaining intervals to add from input array. just
              add it as-is
        3. once we have result array list, we can do `.toTypedArray()` to
           convert it back to Array


    **Complexity** Time: O(n) Space: O(1)

### 01 Matrix

    _Default case_, if the matrix is empty, do nothing

    **Solve**
        1. we need to do 2 pass for the entire matrix, start from top/left and
           then from bottom/right
        2. for each cell that is not = 0, we check min distance from closest 0
           between top/left cell then + 1, but if it's top/left most cell we
           default to some max value (the other corner from current location),
           cause there's still possibility the closest 0 is at bottom/right of
           the cell
        3. once finish we start from bottom/right instead, now we check if the
           one we calculated from top/right is actually the closest or we can
           find the same thing from bottom/right cells

    **Complexity** Time: O(m*n*2) // loop the matrix 2 times Space: O(1)

### K Closest point to origin

    _Default case_, if there is no point to check or k is negative/0

    **Solve**
        1. We need priority queue (min heap) to store the number of points in
           closest manner by using this compare script 
           `(x1*x1 - x2*x2) + (y1*y1 - y2*y2)`
        2. then we just offer what ever we have in points to heap.
        3. to get k closest point, we just poll heap k amount of times

    **Complexity** Time: O(n + log(n)) // (normal heap time complexity is
    log(n) but heapify is O(n)), Space: O(n)

### Longest substring without repeating character

    _Default case_, if the input string length is 1 or less then there's no
    repeating character

    **Solve**
        sliding windows question using set/map to check for duplicated char
        Before incrementing end pointer check if set already exists, if yes
        move the start pointer until we remove that char.
        then we can add the char into set and move end pointer and calculate
        whether the current substring (from start to end) is the longest or not

    **Complexity** Time: O(n) Space: O(n)

### 3Sum

    _Default case_, if the input array have 2 or less number, we cannot produce
    3 sum.

    **Solve**
        1. the question statement doesn't say the array is sorted, so we need
           to do sort once O(nlong)
        2. create mutable set to hold the list of sum 0 pairs. we need set
           cause we might be end up with duplicated record, so this is a
           cheapest safeguard
        3. loop from index 0 until 2 index before last index (this is to allow
           us to get another 2 number to do sum)
        4. in each loop do 2 pointer from index i + 1 and last index to try
           find sum 0 pairs.
        5. if found the pair add to set and keep on going until we reaches
           final pair.
        6. last step convert result set into list to satisfy the problem return
           type

    **Complexity** Time: O(n^2) Space: O(1)

### Binary tree level order traversal

    _Default case_, if the root is null return empty list, there's nothing to
    traverse

    **Solve**
        1. create mutable list of mutable list to store result
        2. create helper function to do traversal, input tree node and the
           level currently in.
        3. for the helper function, do the same default case. then check if the
           size of result is at the same level, if yes then we need to create
           empty mutable list to store all the node value
        4. for each function call add current node value to the list of current
           level
        5. then recursively call traverse from left to right branch
        6. in main function, we can just call traverse from root with level 0
           and just return the result build from helper function

    **Complexity** Time: O(h) Space: O(1) // not keeping account of result list

### Clone graph

    _Default case_, the node is null, just don't clone anything and return null

    **Solve**
        1. this is DFS question. so we create map to keep track of visited node
           and create dfs helper to do the job
        2. the dfs helper will accept any node and create a clone of it and put
           that into map. then it'll traverse the original node neighbors and
           check if it's been visited already by lookin at the map. if yes,
           just add the cloned neighbor into this cloned node. otherwise do
           another dfs and add the cloned neighbor into this clone node.
        3. then we just call dfs to root node and recursion stack will handle
           the clone for us.

    **Complexity** Time: O(v + e) Space: O(v + e) //node + neighbors 

### Evaluate reverse polish notation

    _Default case_, if the input is empty it's 0, if input size is 1 then
    that's the result, just return it as int. we can ignore pretty much all the
    error handling since the question statement itselves state that all input
    are arithmetically correct.

    **Solve**
        1. create stack to hold all the int value
        2. loop thru the input tokens, if found mathematical operation just pop
           previous 2 int and do math, then push back. otherwise just push the
           number into stack
        3. lastly, just pop the remaining value in stack as a result. we can
           assume this from the statement that the input is arithmetically
           correct


    **Complexity** Time: O(n) Space: O(n)

### Course schedule

    _Default case_, if there is no prerequisites or only 1 course, it can
    definitely be finished

    **Solve**
        1. this is one derivative of dfs question. idea is to find if we have
           loop in a graph or not. can view the prerequisites list as graph
           neighbors
        2. create list of node (course) with neighbors (prereq course)
        3. once we have the graph, we can just create 2 helper list to store if
           it's a studying node or finished node
        4. in helper function, accept course number, and do 2 initial check
           whether it's already finished per the prerequisites course from
           other already, if yes then return true for that course, and check if
           it's still a studying course from another chain of prereq courses or
           not, if it is then return false since the course is stil not
           finished
        5. once we passed initial check, we do dfs to the entire prerequisites
           for that certain course, and check if there is any ongoing studying
           course in the list, if there is return false, since we found the
           node loop
        6. if we can pass the prerequisites loop, then we considered that
           course finished and remove it out from studying list
        7. then we use this dfs to check for all the courses if we can study
           all of it. and same thing if we found any course stuck in the loop
           then we can just return false since this schedule can never be
           finished. otherwise, return true if we can pass the entire loop

    **Complexity** Time: O(v + e) Space: O(v + e) // same complexity with
    normal graph problem since we need to reach each vertices and edges once.

### Coin Change

    _Default case_ if amount is 0 then we don't need any coin. if there's no
    coin, then we can't produce result

    **Solve**
        1. We will use dynamic programming with memiozation to solve this
           question. first create dp list to store number of least coins uses
           for each total amount up to amount+1 (to prevent index out of bound)
           then default it at max integer means we still don't know if we are
           able to build that total amount from the coins we have. but we know
           that to build 0, we need 0 coin
        2. then for each coin, we wanted to know from it's value up to the
           amount, can this coin help reduce the number of coins uses at any
           certain amount in db array
        3. in each coin iteration, we need to have nested loop to see if this
           coin will be benefit. by checking if we replace this coin value in
           any x amount we pass thru, will it result in less coins used or not
        4. e.g. for coin value 1 -> we loop from 1..amount(let's say 5), in
           each amount n loop we check if we can build n-coinValue e.g.
           dp(3-1=2) means we can use that number of coins to build value 2 +
           this coin of value 1. we check that to build this will it result in
           less coin used rather that the knowledge we have at dp[3]. if it
           helps we replace the number of coin used
        5. finally, we check before return that dp[amount] is not max int, if
           it is then we cannot build that amount from value of coins we have,
           return -1 else return dp value that we found so far

        **Complexity** Time: O(coins size * amount) Space:O(amount)

### Product of array except self

    _Default case_, if the input array size is 1 or less then just return it

    **Solve**
        1. we create 2 new variable result list and temp variable to keep track
           of multiplication
        2. then we do 2 loop from left to right and right to left, in each
           loop, we try to do *= temp to that result index. then we do *= with
           actual value in the source index to temp variable
        3. now we will be combining all the result from left and right into
           each certain result index

    **Complexity** Time: O(n) Space: O(1)

### Min Stack

    _Default case_, there is no default case it's a data structure

    **Solve**
        1. this question uses LinkedList to help with the complexity, but we
           add one more field call min, to always stored min value of entire
           list
        2. for a start we create null node, then for each operation, we do
            - push: if node is null create new node with value and min == input
              value and next node is null, otherwise, we create new node with
              value = input, min = min of current node and input, and next node
              is the previous one O(1)
            - pop: we just move the node to next pointer O(1)
            - top: return the value of head node O(1)
            - min: returned the min value in the head node O(1)

        **Complexity** Time: O(1) Space: O(1) // all the data stored is part of
        answer

### Validate Binary Search Tree

    _Default case_, if the root is null then it's valid

    **Solve**
        1. create helper method to do cascade check whether the tree is valid,
           by defining the min and max value for each node not to bypass this.
           then we cascade to left and right branch by setting min/max value to
           current value accordinly
        2. in core function, just pass root and actual MIN/MAX value (in Long,
           this will prevent int overflow)
    
    **Complexity** Time: O(h) Space: O(1)

### Number of Islands

    _Default case_, if matrix is empty then return 0

    **Solve**
        1. this question can be solved with dfs by starting from top left of
           the grid. and once 1 (an Island) is found we append the tracker then
           do dfs to drown the entire island
        2. in dfs, we do normal bound check, and check if it's island or not.
           if yes we drown it and cascade 4 direction horizontal and verically
        3. once we reaches end of grid, return the tracker.

    **Complexity** Time: O(m*n) Space: O(1)

### Rotting orange

    _Default case_, if the grid is empty then there's nothing to rot

    **Solve**
        1. one of DFS question variant with some twist. 1st we need to do 1
           loop to rot the entire grid. by starting from top/left of the grid
           and cascade the way down.
        2. in first loop, once we found rotting spot (2) we call dfs helper
           function to cascade the rotting to other cells along with the
           rotting minute (2).
        3. helper dfs is handles normal out of bound, if cell is 0, or if cell
           is rot but minute that rot is lesser than current minute, we don't
           touch that. otherwise change the cell value to the minute it rot.
           then call same function stack to 4 directional with minute +1
        4. then we do another loop to get the max value of minute this grid has
           rot. do keep in mind that we should start from 2 to skip those 0s
           and 1s.
        5. if in 2nd loop we found 1, then the batch is not entirely rotten
           return -1
        6. otherwise if it's more than 1 we keep collecting the max value.
        7. then finally we return maxtime - 2 (from the shift we do earlier to
           get actual rot minutes)

    **Complexity** Time: O(m*n) Space: O(1)

### Search in rotated sorted array

    _Default case_, if the input array is empty then return default -1


    **Solve**
        1. this is one of the variant of binary search question, so the idea is
           pretty similar
        2. first binary search, we will try to find the min value in array.
           just like the first bad version question. check mid with value of
           last index, if it's larger, then min is right of the mid, otherwise,
           the current location might be min or it's on left side
        3. once we know index of min value, we check if our target is
           smaller/bigger than last index of the input.
            - if it's smaller -> target must be between min up until last index
            - if it's larget -> must be between 0 until 1 index before min
        4. then we do normal binary search with new scope we set normally.

    **Complexity** Time: O(logn) Space: O(1)

### Combination sum

    _Default case_, if input array is empty then return empty result

    **Solve**
        1. this is backtracking problem, so we need to create helper
           backtracking function.
        2. the goal of this backtrack function is to add temp list of sum ==
           target into result list. if exceed we do nothing, if sum stil not
           reaches target we keep looking to add more value in candidates into
           the temp list (we don't search entire list but rather try adding
           only from index we are on onwards)
        3. we call backtrack function with some mutableMap and tell them to
           start looking in index 0 of candidates array
        4. after that we can return the result since backtracking already
           handle everything

    **Complexity** Time: O(2^n) Space: O(n) // usual backtracking complexity

### Permutation

    _Default case_, if input array is empty then return empty result

    **Solve**
        1. this is another backtracking problem, so we need to create helper
           backtracking function.
        2. goal of this problem is to create another array of same size as
           input but in different ordering. so we do base check in backtrack
           function to see if the size are equals, if yes just add to result
           list. otherwise we loop entire input array to see if we have any
           value not added into temp list or not.
        3. we call backtrack function with some mutableMap
        4. after that we can return the result since backtracking already
           handle everything

    **Complexity** Time: O(2^n) Space: O(n) // usual backtracking complexity

### Merge Intervals

    _Default case_, if the input interval size is 1 or less there's nothing to
    merge

    **Solve**
        1. since the question statement doesn't state anything about input
           being sorted, we need to sort the intervals by 1st value
        2. we create new list to store the result. and create 2 variable to
           hold min/max value of each iteration (this is to support the merge)
        3. start the loop from index 1 until reachs end of intervals, for each
           iteration. always check if the 1st value in interval exceed current
           max value already, if it is then we need to push the merged interval
           from min/max into result list. and then define new min/max as the
           one we encountered
        4. otherwise, we still need to merge the intervals, so we can just keep
           updating the max value since min will always be the 1st one we
           selected from the sorting
        5. then we convert list back to ToTypedArray() and return the result

    **Complexity** Time: O(nlogn + n) //sorting and iterating Space: O(1)

### Lowest Common Ancestor (LCA) of Binary Tree

    _Default case_, if root is null or root == p or q then root is the lca of
    the tree

    **Solve**
        1. This is a normal dfs tree question, so we reuse the default case to
           solve question in recursion stack
        2. from the root, we check 2 thing if it passed default case, then try
           to see of left or right can be the candidate for lca or not
        3. if both left and right doesn't return null then we found both p and
           q as a descendant from the current root. return root. otherwise if
           one side of it is null, then the lca should be on another side

    **Complexity** Time: O(h) Space: O(1)

### Account merge

    _Default case_, if size of input is 1 or less, nothing to merge

    **Solve**
        1. This question is a harder to comprehend graph/dfs question. so we
           would need to create a graph to link all the email to their
           correspondent neighbors in the same owner set
        2. then we need helper function to merge the list of email together
           from the graph we have. this can be done by normal dfs with visiting
           variables. e.g. we receive some email in with temp list, if the
           email is not yet visited we add into temp list and visited list,
           then we find all their neighbor and call the helper function to
           visit all the email in the graph node
        3. then in final loop, we loop from all the possible email we have and
           try to visit each one using helper function we create previously.
           then we sort the result and add owner into index 0 from owner map we
           created previously

    **Complexity** Time: O(nlogn) Space: O(n) // n == number of distinct emails

### Sort color

    _Default case_, if the input array size is less than 2 there's nothing to
    sort

    **Solve**
        **this is a sorting question, so we can practice quicksort and
           mergesort
        - Quicksort
            1. idea is to always cut the array in half and sort each of it in
               recursion stack.
            2. create 3 helper function quicksort, partition, swap. all including
               left and right pointer as a params
                - quicksort is the main recursion call, do this function if the
                  left pointer < right pointer. what to do is call partition
                  function to find mid point of half sorted array and call
                  another quicksort recursively for each of left/right half
                - partition, this function will assume the rightmost index
                  value is the arary partition, it'll try to swap item around
                  so that left half value is less than partition and right half
                  value is greater than the partition
                - swap, straightforward, swap value between 2, indices.
            3. in core function we just call quicksort with left/right most
               index and everything will be sorted automaticaly
        - Mergeosrt
            1. idea is to split the input index up until the point where we
               have n array of size 1 and try to merge them together in a
               sorting manner
            2. we need 2 helper function, mergesort and merge.
                - mergesort helper is similar to quicksort helper, it handles
                  splitting the array in have and do a recursive call. so for
                  mergesort we need extra n space for the splitted array. after
                  we splitted the array into 2 halves, we call another helper
                  merge to merge both of them back in a sorting manner
                - just like the merge 2 sorted list question we have pointer on
                  each half and keep adding smaller value in to main array
            3. same thing in core function just call merge sort from left/right
               most index

    **Complexity** Time : O(nlogn) Space: O(n)

### Spiral matrix

    _Default case_, if the matrix is empty just return empty list

    **Solve**
        1. create result list to collects the answer.
        2. do while loop until result list size is equals to matrix size
           (rows*cols)
        3. for each while loop, do 4 subsequence steps
            - loop from left to right index inclusively
            - loop from top to bottom index exclusively (without top and bottom
              idx included)
            - loop from right back to left index inclusively
            - loop from bottom back to top index exclusively
        4. for each loop, keeps checking of result size is equals to matrix
           size or not. if not add that cell into result.

    **Complexity** Time: O(m*n) Space:O(1)

### Subset

    _Default case_, if the input array is empty return empty list

    **Solve**
        1. this is another variant of backtrack problem. the idea is to get all
           possible subset of input array.
        2. create result list to keep track of subset value
        3. create backtrack function, always push temp list into result list
           since we want all sort of subsets. in for loop part of backtrack,
           keeps the current index and always call another backtrack
           recursively to next index to let it fill the subset
        4. in main function, just call backtrack with some temp list and start
           from index 0

    **Complexity** Time: O(2^n) Space: O(n) // usual backtracking complexity

### Binary Tree Right side view

    _Default case_, if the root node is null return empty list

    **Solve**
        1. create helper function to collect node and level. if the result size
           is same as level, means we are in new level, we push that node value
           in.
        2. then we do recursive call starts from right branch first, to align
           with question statement rightsie view. and then do left afterwards.
        3. for main function, just call the helper function to traverse from
           root node and level 0
        4. finally recursive stack will handle and fills right side value and
           we can return the result list

    **Complexity** Time: O(h) Space O(1)

### Longest Palindromic Substring

    _Default case_, if input string is 1 or les return that string

    **Solve**,
        1. idea is to loop thru each index and try build odd(1 char and then
           palindrome to left and right) or even(entirely palindrome string)
           from that certain index
        2. so we need helper function to generate palindrome string, by
           inputing starting index on left and right (to support building both
           even/odd palindrome)
        3. while we have result string, odd/even palindrome, at every
           iteration, just replace longest string into the result

    **Complexity** Time: O(n^2) Space : O(1)

### Unique paths

    _Default case_, if input m or n is 0 then it's not a complete matrix return
    0. if input m or n is 1, then there is always 1 possible way to move to
    finish

    **Solve**
        1. this is a dynamic programming question with help of memoization. so
           we need to create matrix to store number of possible move at each
           cells
        2. we will use top down approach to solve this by question
        3. we know for a fact that from first row/column, we only have one way
           to move forward, which is either go down or go right. then in DP
           matrix we can initialized that fact.
        4. then we can start from row/col index 1, then work the way towards
           last row/column where finish line is at
        5. for each iteration, in that certain cell, we know that to get here,
           we can either comes from top or left cell. then the possible ways to
           get here will be sum of the way to get to top cell and left cell
        6. finally, at the finish line we will have all the possible ways to
           get to that point. return that value

    **Complexity** Time: O(m*n) Space: O(m*n)

### Construct Binary Tree from Preorder and Inorder Traversal

    _Default case_, if either of the input array is empty then we aren't able
    to construct any tree

    **Solve**
        1. we need to understand the nature of preorder/inorder traversal first
           to be able to answer this question. so the order (from tree) is like
            - preorder: top --> down (left --> right). this will help us define
              the root of each iteration as we are going top down
            - inorder: left --> right (top --> down). this clearly define
              information of which side of branch each node are on based off
              the preorder value
        2. now we need helper function to input starting index of preorder and
           defind scope of inorder to build branches
        3. helper function will stop if encountered with invalid condition,
           e.g. preorder starting index out of bound, left pointer exceed right
           pointer in inorder 
        4. after that we create node based off value in preorder starting index
        5. then we get the index of that value in inorder array, to be able to
           specify scope of left and right branch
        6. for left branch, we start at next preorder index, with scope from
           left pointer to left of node index in inorder array
        7. for right branch, we start at preorder + size of left side of the
           node's branch + 1. and next pointer of node index until right
           pointer in inorder array

    **Complexity** Time:O(n) Space:O(n) //space of recursive stack

### Container with most water

    _Default case_, if the input array size is 1 or less, we cannot build
    container

    **Solve**
        1. use 2 pointer to solve this issue. starting at left and right most
           index with a result variable
        2. while left < right pointer, keeps calculating the container size by
           doing lower bound * index diff. if it's bigger than previous result,
           replace it with current one
        3. after that try move the index with lower bound to next index then do
           the same calculation again. until finished and return the result
           variable

    **Complexity** Time: O(n) Space: O(1)

### Letter combinations of phone number

    _Default case_, the input string is empty

    **Solve**
        1. this is another variant of backtrack problem, so backtrack helper
           function is a must
        2. first we need to create array of letters map to be reuse in
           backtrack function
        3. in backtrack function, we insert stringbuilder and current index of
           digits. if stringbuilder length equals to digits length, add that
           string into result
        4. otherwise, we need to get all the letters combination from letter
           map according to that digits index then do backtrack to add the
           letter into string builder and call recursively to next digit
        5. then we can return the result list as backtrack handles all the
           calculation

    **Complexity** Time: O(2^n) Space: O(n) // usual backtracking complexity

### Word Search

    _Default case_, if word is empty, return true. if board is empty return
    false

    **Solve**
        1. one of the dfs question variant. we need to traverse through the
           matrix to find the starting point (character == 1st index of word we
           search). If found, we try to do dfs to traverse thru each index of
           word. if we can make it to final index. then we found the word.
           return true. else keeps searching thru next character in board
        2. if finally after traversing entire matrix but still cannot build the
           word, return false


    **Complexity** Time: O(m*n*4^l) Space: O(l) // m*n == board size, l = word
    length

### Find all anagrams in a string

    _Default case_, there's no default case for this question

    **Solve**
        1. this is a sliding window problem which utilize map as a helper
        2. first we push all characters with number of occurance into a map. we
           also create variable to keep track of total number of unique chars
           we have in the map
        3. then we create sliding window and loop thru string s. In each
           iteration. we do 2 things.
            - moving end pointer and keeps reducing the occurance number in
              map. if the occurance reaches 0 we reduct the total of chars.
            - another inner loop while we reachs total uniquq chars == 0, means
              we probably found an anagram, but we only add the index if and
              only if the size of start-->end pointer is equal to string p.
            - then in the same while loop, we keeps incrementing start pointer
              and adding value back into the map. once some certain character
              occurances exceeds 0 then we increment totalUniqueCharacters
              value means we lose the anagram feature in current window, so we
              keeps exapanding/decreasing window till we reaches the end of
              strign s
        4. finally the result will consists of all starting index where we
           found an anagram

    **Complexity** Time: O(n) Space: O(n)

### Minimun Heights Tree
    
    _Default case_ if n == 1 return list of 0, that's the only possible answer

    **Solve**
        1. the idea of this question is to build a bi-directional graph along
           with the list that holds the degree of the node. (degree means the
           link it have)
        2. then after we have this, we uses queue to do BFS by keeps
           eliminating the leaves (then use graph to reduce the degrees of each
           eliminated node neighbors) until we only have 1-2 nodes(we keep
           track of how many node is left via another variable) (this needs
           mathematic explianation, just rememeber the value)
        3. that 1 or 2 node(s) are the answer to this question

    **Complexity** Time: O(n) Space: O(n)

### Task Scheduler

    _Default case_, if we only have 1 task or each task doesn't need idle
    period. return the tasks size that's the most minimal order

    **Solve**
        1. the question statement define that the task name only contains upper
           case english letter, so we at least can define the scope somehow.
        2. 1st we loop thru the input task to try sort the number of occurance
           of each task alphabet.
        3. once we sorted, we know that at index 25 (last character) is the
           most frequent tasks we need to do.
        4. we can based off that most frequent tasks and try fill other task in
           between the idle gap we have. (the idle gap will be n * (most
           frequent tasks -1)) the -1 is the last task we can put at the end.
        5. now we loop from index 24 (2nd most frequent task) down to 0 (least
           frequent task). for each iteration, we can reduce total number of
           idle slot by filling in the tasks (do note that the 2nd/3rd/... most
           frequent task, might have the same number of frequency) so we do
           minOf to compare the frequency of most frequent task with other. if
           the frequency is the same the most frequent task will have less
           frequency cause we exclude the last task as it can always be put
           last and it wouldn't affect the total number of tasks/idle period
        6. finally, we check if we have idle period, if yes we need total
           number of tasks + idle to finish everything. otherwise we don't
           really need any idle period

    **Complexity** Time: O(nlogn) Space: O(n)

### Kth smallest element in BST

    _Default case_, if k is 0 or root is null, then we cannot solve the
    problem, return 0

    **Solve**
        1. this question is to teach us inorder traversal of bst. so we can
           create a sorting helper function to do inorder traversal and return
           the kth-1 index value from sorted list
        2. to do inorder traversal we just create helper function to push node
           value into list in the middle of 2 recursive call to left and right
           branches

    **Complexity** Time: O(h) Space: O(h) // recursion stack

### Daily temperatures

    _Default case_, if the temperatures size is 1 or less, we cannot get any
    warmer, return array of 0 state that it can't be warmer

    **Solve**
        1. this is a stack question, so we 1st create a default result list of
           value 0 stating that there's no warmer day for any index
        2. then we loop thru each index keep adding the index number into the
           stack. but for each index we reach, we keep checking while the stack
           is not empty and we found out that current index's temperature is
           actually hotter that the one on top of the stack.
        3. that is when we know that for the previous unprocessed index, we
           found the earliest hotter day. which is the day in the index.
        4. then we just update the result list of that index to be number of
           difference in days we are at and that initial date
        5. finally, we return the result list

    **Compleixty** Time: O(n) Space: O(n)

### Gas station

    _Default case_, if input array is empty then there's nothing to calculate

    **Solve**
        1. we wanted to find the starting point that allow us to do 1 full
           circle, then we need to keep track of the valid starting point and
           whether it's possible to go full circle or not (based off the gas in
           tank and cost to go)
        2. to determine starting point, we can just check if from point a to b
           we can even use that gas amount to go. if not the starting point
           might possibly be at point b+1
        3. finally, before return the starting point we found, we first need to
           check if we can go full circle from the total gas usage variable we
           keep track since beginning

    **Complexity** Time: O(n) Space: O(1)

### Valid sudoku

    _Default case_, if the board is empty then it's probably valid we cannot
    check anything

    **Solve**
        1. we know from sudoku rule that we can have 1 number per
           row/col/diagonally.
        2. from this rule we can just use simple string set to keep track of
           each value in each row/col/diagonal position. when we try to add
           some value and it's exists in set, then the sudoku board is not
           valid we can just return false
        3. if we gone thru entire board then it's a valid board

    **Complexity** Time: O(m*n) Space : O(m*n)

### Group anagram

    _Default case_, if the input is empty return empty list

    **Solve**
        1. idea of this question is easy, we create some map to store string in
           group of sorted variance of itselves.
        2. so we just loop thru each string, try to sort it and add itselves
           into sorted groups.
        3. then finally, we can just pick just values and convert into list

    **Complexity** Time: O(n * nlogn) Space: O(n)

### Pacific Atlantic water flow

    _Default case_, if the input matrix is empty then return empty list

    **Solve**
        1. idea of the question is to return the coordinate(s) in matrix where
           rain water flows to both pacific and atlantic ocean
        2. so, we need 2 boolean matrices to store each coordinate that water
           can flow back to either pacific or atlantic ocean respectively
        3. the idea to check the water flow is one variance of dfs question. so
           we need dfs helper function to do reverse check if water from each
           ocean can reaches back to that certain cell.
        4. in helper function, we do normal out of bound check, if the water is
           already flows thru that coordinate, or if water aren't able to reach
           that certain cell since the height of current coordinate is lower
           than the surrounding cells
        5. otherwise we mark the cell as reached
        6. in main function, we loop thru each column, top and bottom row, to
           see if pacific and atlantic ocean water can reach back to each cells
        7. then in each rows, left and right most column, we do the same to
           check ocean water can flow back or not
        8. then finally we iterate thru the matrix. to see if both pacific and
           atlantic reach boolean array are true. if yes we add that coordinate
           into result list.
        9. then return the result

    **Complexity** Time: O(m*n) Space: O(m*n) // we need to flows to all cells
    3 times

### Remove nth node from end of the list

    _Default case_, if the input node is null or n == 0 then it's invalid

    **Solve**
        1. we need 2 pointer to find the location to skip the nth node
        2. 1st pointer is to move it n times. if after move, the pointer points
           to null location, then the node we need to remove is head node. we
           can early return head?.next
        3. otherwise, we create new pointer at head, then move both pointer
           until the 1st pointer next is null. the 2nd pointer will point at
           exactly 1 node before the one to remove
        4. then we can just skip next node and return it's head

    **Complexity** Time: O(n) Space: O(1)

### Top K Frequent word

    _Default case_, if input array is empty or size is less than k then it's
    invalid input

    **Solve**
        1. this is a max heap problem (when poll most frequent word pop out)
        2. to be able to determine whether the word is more frequent we need 2
           condition (lexicographical order)
            - it's appear more often
            - it's lexicographically more than it's comparator
        3. to achieve this we can create max heap according to the requirements
           above by inserting pair of word/frequency into the heap
            - 1st check frequency
            - then check lexicographical order by using
              string1.compareTo(string2)
        4. then build the map of word-->freq pair from input array.
        5. push each pair into max heap, then as a result we can just poll top
           k pair and add the word into result list

    **Complexity** Time: O(nlogn) Space: O(n)

### Course schedules II

    _Default case_, if there's no prerequisites or only 1 course or less, just
    build int array of number of courses in incremental order

    **Solve**
        1. this is just Course schedules question that want us to answer with
           finished list instead of boolean
        2. the entire logic is the same, just change the return type and value

    **Complexity** Time: O(v + e) Space: O(v + e) // same complexity with
    normal graph problem since we need to reach each vertices and edges once.

### Longest consecitive sequence

    _Default case_, if the input array size is 1 or less, that's the longest it
    can get

    **Solve**
        1. instead of looping thru list, we convert list to set for quicker
           lookup and less number of check we need to do since set doesn't
           allow duplicates
        2. for each number in set, we check if it's the starting number of some
           consecutive sequences. (by checking num-1 is not in set) this to
           help speed up the process and prevent TLE error
        3. after we know that it's the starting number of sequence, we keeps
           checking if we have next number until there's none, then check with
           the result variable if it's exceeding previous range or not
        4. then finally we return the longest range

    **Complexity** Time: O(n) Space: O(n)

### Rotate array

    _Default case_, if k rotation is 0 or same as array size, or is a multiples
    of array size. then we don't need to do anything since it's creating same
    result

    **Solve**
        1. idea is to find a pivot point and reverse the subarray per that
           pivot and reverse the entire array. this will help do the rotation
        2. to find pivot point, we do k modulo from array size to see how many
           rotation we need to do. then we subtrac that from size of array to
           get the pivot point
        3. then we do 3 reversal.
            - left most index until pivot point
            - next to pivot point to right most idex
            - entire array
    
    **Complexity** Time: O(n) Space: O(1)

### Decode string

    _Default case_, if string length is 1 or less, nothing to decode

    **Solve**
        1. we might be encounter the nested decode string so we need some stack
           to handle that
        2. this question splitted text into 4 variance
            - digits --> when found, we just append the character into count
              builder (in order to build int)
            - [ --> once we reachs open bracket, we know that we need to store
              latest count and string into a stack to give way for calculations
              inside bracket.
              ] --> once we found closing bracket, we know we need to append
              the text we built during the bracket n amount of times
            - else (normal character) --> append the whatever here into result
              string
        3. as we have utilities logic, we just loop thru each character and
           calculate the final string

    **Complexity** Time: O(n) Space: O(n)

### Contiguous Array

    _Default case_, if the input array is empty then return 0

    **Solve**
        1. nice to know keyword, contagious means range in array that sums to 0
        2. so this question is talking about range with sums of x, we will use
           prefix sum to help.
        3. idea is to keep adding sum variable (if found 1 -> +1 else -1). then
           in each iteration we check if sum is 0, if yes the entire range from
           idx 0 is contagious we store that candidate into some variable.
        4. another way to find contagious array is to find some range in the
           middle that sums to 0. we can do by subtracting some sum from idx0
           til idx n from total sum. this is what prefix sum is made for.
        5. that means for each iteration, if we found some sum in prefix sum
           map. we check if it's longer than current longest range or not by
           subtracting current idx with prefix sum idx
        6. else, if there's nothing matched, we try adding the prefix sum and
           current idx into the map

    **Complexity** Time: O(n) Space: O(n)

### Find K closest elements

    _Default case_, if size of input array is less than k or k == 0 return
    empty list

    **Solve**
        1. The question seems to be leaning towards heap question but actually
           it's a 2 pointer questions
        2. we just need to start from left and right index of array and try to
           close the bound per the requirement in definition. the only
           difference is we need to close the bound up until we have k elements
        3. finally one we know the range, we just build a list according to
           that range

    **Complexity** Time: O(n) Space: O(1)

### Jump game

    _Default case_, if array size is 1 there is no need to jump

    **Solve**
        1. we can start from last index and work way back to see if we can
           somehow reach index 0
        2. keep track of current index we are at (starting from last index)
        3. for each iteration from last index -1 down to 0 check if we can jump
           from that index to current index. if yes move cur index back
        4. finally check if cur index is 0 or not

    **Complexity** Time: O(n) Space: O(1)

### Jump game II
    
    _Default case_, if array size is 1 there is no need to jump

    **Solve**
        1. this question doesn't solve the same way as previous question. we
           need to keep track of the index we are at, maximum index we can
           reach for any point of index we passed, and number of jump we made
        2. for each iteration, we keeps finding the maximum index we can go by
           checking how far we can jump
        3. once we iterate to the index we are at currently, we jump as far as
           possible and increment jump count
        4. after jump we check if we have reached last index or not, if yes we
           return jump count
        5. actually the answer should be returned in the loop since question
           state that we can always jump to last index. but to not make
           compiler error we return number of jump at the very last

    **Complexity** Time: O(n) Space: O(1)

### Add Two number

    _Default case_, if both list are null return null, if either of it is null
    return other one

    **Solve**
        1. solving method is exactly similar with normal number adding but in
           linked list format. as the input is already reversed we can just
           adding the value together and keep going to next node
        2. to create new digits node we just add value in node1 and node2 with
           some carry value. the value added in node is to be %10 (get the
           ramainder) and we update carry this time /10 (to get the multiples
           of 10)
        3. once we create new node, just point next of the iterator node (from
           temp head node created initially) then we move all pointers to next
           nodes.
        4. lastly we check if we need to add carry to last digit, if yes we can
           do the same thing as step 3.

    **Complexity** Time: O(n) Space: O(1)

### Generate parentheses

    _Default case_, if n is 0 return empty list, n is 1 return list of ()

    **Solve**
        1. This is another type of backtrack question. so we need backtrack
           helper to solve this question
        2. backtrack helper collects 3 things
            - stringbuilder
            - count of opening bracket
            - ccount of closing bracket
        3. in backtrack, if we found that length of string builder is == n*2,
           we add that string in
        4. otherwise, we check if count of opening parentheses is less than n
           we add it and do recursive backtrack
        5. we then check if closing bracket is less than opening, we add it and
           do backtrack
        6. return result as we backtrack from 0 bracket in temp string builder

    **Complexity** Time: O(2^n) Space: O(n) // usual backtracking complexity

### Sort List

    _Default case_, if current node or next node is null then there's nothing
    to sort

    **Solve**
        1. this is a merge sort question but in linkedlist format.
        2. we need to find mid point and call sort on left and right side. then
           merge each side together

    **Complexity** Time: O(nlogn) Space: O(n) // recursive stack space

### Subarray sum equals k

    _Default case_, if the input array is empty there's no possible sub array

    **Solve**
        1. this is a prefix sum question, so we can do it in 1 pass
        2. the prefix sum will store the sum, and number of occurance from
           previous pass in input table
        3. for each iteration, we add value into sum, and check if sum is
           equals to k or not, if yes we found 1 combination, then we check
           again if we found prefix sum whose sum is equals to curSum - k, if
           yes we can possibly create n more amount of times this kind of sub
           array
        4. and lastly in each interation, we need to add sum and occurence into
           prefix sum map.
        5. finally we will have n total amount of sub array in any sort order.

    **Complexity** Time: O(n) Space: O(n)
        
### Kth Largest Element in an Array

    _Default case_, if the size of input array is less than k means we cannot
    find kth largest element

    **Solve**
        1. this is a maxHeap question. so we just create maxheap(a,b -> b-a) to
           store all value in input array
        2. then we poll from heap k-1 times, and return the last poll

    **Complexity** Time: O(logn) Space: O(n)

### Rotate Image

    _Default case_, if matrix is empty, return

    **Solve**
        1. to rotate it we need to reverse the entire matrix horizontally
           (start from top and bottom row and work way towards center) and
           then transpose it (do start from row 0 to last row but starts from
           col = row+1 to last col nested and swap row/col)

    **Complexity** Time: O(m*n) Space: O(1)

### Pow(x,n)

    _Default case_, if power == 0 returns 1

    **Solve**
        1. we need math to help solve this issue. idea is x^n is (x*x)^(n/2)
        2. since we know the math signature above we can create helper function
           to handle even and odd power (always treat power value as long to
           prevent overflow)
            - even case we create recursive call stack for (x*x)^(n/2)
            - odd case we crete recursive stack for value * even case(power-1)
        3. then we defaulted the function as power ==0 return 1

    **Complexity** Time: O(logn) Space: O(1)

### Search a 2D matrix

    _Default case_, if input matrix is empty return false

    **Solve**
        1. just do nested binary search 1st to determine the row then see if we
           have a target value in that row or not

    **Complexity** Time: O(log(m*n)) Space: O(1)

### Largest Number

    _Default case_, we can return the result early of input is empty or of size
    1

    **Solve**
        1. This is another max heap question, so we need to create max heap
           using string compareTo function (max means we often starts with 2nd
           value compare to 1st) but this one we try to combine so num2+num1
           compareTo num1+num2
        2. we just adding the value into heap and poll it out to a string
           builder as a result
        3. 1 edge case before returning, if we found out that 1st index if
           string is 0 then in the input 0 is biggest value, we return 0,
           there's no need to return 00000000000. here we don't convert it to
           int or long since the number might be too big and will overflow.
           just checking 1st index is better

    **Complexity** Time: O(nlogn), Space: O(n)

### Reverse Integer

    _Default case_, if value is > -10 and < 10 then return it. cannot reverse
    it

    **Solve**
        1. always handle this question with positive number, just log variable
           if the input is negative
        2. use % to get digit of each iteration and keep /= 10 to reduce the
           size to keeps getting digit
        3. then each iteration keeps checking if the accumulated result is
           overflowing by checking if it's > max Int - digits or < min Int +
           digits
        4. after loop thru all the digits, just return positive/negative value
           accordingly

    **Complexity** Time: O(n) Space O(1)

### Set Matrix Zeroes

     _Default case_, if matrix is empty return

     **Solve**
        1. we use row0 and col0 to mark if the entire row/col needs to be
           marked as 0
        2. so 1st step is to have a boolean mark whether we should also mark
           row0 or col0 as zero as well in last step
        3. then we start looking from row1/col1 onwards by checking at
           col0/row0 whether that certain row/col needs to be marked as zero,
           if so do the mark
        4. last step, we check from boolean we created initially to mark
           row0/col0 as zero if we need to

    **Complexity** Time: O(m*n) Space O(1)

### Reorder List

    _Default case_, if the list size is 2 or less the result will be the same

    **Solve**
        1. this question combines multiple linked list modification e.g. split
           at mid, reverse, combination
        2. so the idea is to follow those method and get the result.
            - Split node at mid point, use slow/fast pointer and split the node
              at slow pointer and return head of second half
            - reverse, just do normal linked list reverse with prev node and
              iterator. to the 2nd splitted half
            - combination, this is the trickiest part, we need to do criss
              cross combination e.g.
              /*
              list1 pointer: p1 r1
              list 1 :       1  2  3
              node linkage : v^ v^  
              list 2 :       5  4
              list2 pointer: p2 r2

              legends: 
                v^ == node connection
                p == pointer
                r == right pointer
              */
              to achieve this we need 2 pointer to point to each list and keeps
              appending the pointer per list 
              we will do this until pointer at list 2 points to null. each
              iteration, what we need to do is store temp value of right
              pointer of both list, then link next of p1 to p2, and p2 to r1.
              then move pointer p1/p2 to r1/r2
              e.g. from above example we will get 1,5,2,4,3 as a result

    **Complexity** Time: O(n) Space: O(1)

### Cheapest Flights Within K Stops

    _Default case, if source == destination, no need to pay. if there's no
    flight, then we can't reach destination
    
    **Solve**
        1. this is one variant of graph question that needs BFS traversal. and
           not DFS. why, BFS respect the traversal by level order (equals to
           number of stops in our case) which satisfy our use case. unlike DFS,
           it do depth first, so it cannot compare the cost between each method
           in the same number of hop as optimized as what BFS did
        2. So, first we need to build a graph of location -> pair of
           destination, cost
        3. after we have a graph, we need create a queue to support BFS
           traversal, in the queue we still store list of 3 int value,
           location, stops, and cost to go there. then we initiate queue with
           source information (location src, stops -1, cost 0)
        4. another list we need to create is to store cheapest way to go to
           each location from source location
        5. in BFS traversal, we start from looking at the 1st value in queue,
           and see if number of stops exceed K or the cost is more expensive
           than what we've been from other route, if one of this satisfied, we
           skip this current location since it doesn't contribute to finding an
           answer
        6. but otherwise, we found another cheaper way to go to a certain
           location (that we don't know if it's a destination or not), then we
           keep adding more possible stops from current location that it can go
           from previous graph we've created
        7. we keep doing the same thing in BFS. then finally once we wanted to
           answer, we first need to check if we ever reach destination by
           checking if the cost to go is still the default interger max or not,
           if it is then return -1(means, it's not possible to go) otherwise
           return the cheapest cost we stored so far

    **Complexity** Time: O(v + e) Space: O(v + e)

### All Nodes Distance K in Binary Tree

    _Default case_, if there is no tree or no target node. return empty list,
    if distance to check is 0 return list of target value

    **Solve**
        1. this is one of the graph question disguise as tree, so we need to
           convert tree to graph by link each node to it's parent and
           left/right child. we can do this by create helper function which
           will try to fill on global graph we created (map of node, to all
           it's neighbor) by receiving certain node with it's parent, if
           parent/left child/right child exists, put linkage into the graph
        2. Once we have a graph then we can just do BFS traversal (BFS works
           better for this question since we can basically kill the traversal
           early if it's traverse over the distance we set up), to do BFS we
           can just have 1 queue with another set of visited node.
        3. For each traversal, we keeps checking if the node is null or visited
           or distance is exceed K. then we can skip the iteration since it
           doesn't contribute to builing answer
        4. if we pass that initial check, we can check if the current level
           (queue will holds pair of node and distance) is the distance we
           wanted to collect the value or not, if yes just add that node value
           into the result list
        5. after that we mark node as visited and add all it's neighbor into
           queue with level+1
    
    **Complexity** Time: O(n) Space: O(n) where n is total number of nodes of
    original tree

### 3Sum Closest

    _Default case_, if the array size is 3 then that's the closest sum

    **Solve**
        1. first initiate the closest sum by summing 1st 2nd and last index
           value
        2. then to make time complexity low we need to sort the array and then
           the questio will just be 3 sum question
        3. follow normal 3 sum question, and keeps updating closest sum
           variable if new sum is closer to target (done by checking absolute
           value off diff)
        4. to move pointer, do normal check, if sum < target move left else
           move right

    **Complexity** Time: O(nlogn + n^2) Space: O(1)

### Find minimum in rotated sorted array

    _Default case_, if the list size is 1 return the only value

    **Solve**
        1. this is normal binary search, kinda easier version of Search in
           rotated sorted array since we just implement the first part of that
           question
        2. we do normal binary search but only until l<r. but when we found
           mid, we check if it's bigger than last value, if yes then min will
           be right of that index, otherwise min might be that index or index
           to the left
        3. keeps doing until finally we return nums[l]

    **Complexity** Time:O(logn) Space: O(1)

### Rotate List

    _Default case_, if k == 0 or linkedlist has size = 1 or less. return head

    **Solve 1st method**
        1. First try to find the tail of list and also a length of linkedlist
        2. once found length, do kMod to see if we need to rotate or not.
        3. if we really need to rotate then first make the list cycle by put
           next of tail to head
        4. then we will know where to cut the linkage and return new head by
           finding the pivot
        5. pivot can be found from total length - kmod, then we repeat the tail
           that amount of times
        6. new head is the node next to tail, cut the link and return that

    **Solve 2nd method**
        1. do 1 loop to get length of linked list
        2. from length, do kMod to find new head position. if kMod == 0 means
           we rotate for k times and endup with same head
        3. then do pointer to find new tail position, 1st pointer run kMod
           times. then run both pointer until next to 1st pointer is null
        4. purpose of 1st pointer is to make linkedlist cyclic by connecting to
           head
        5. purpose of 2nd pointer is to stop at new tail. so we just return
           next value while cutting the tail

    **Complexity** Time: O(n) Space : O(1)

### Basic Calculator

    _Default case_, if trim string gets empty return 0. if trim string get
    length 1 return that char - '0'

    **Solve**
        1. we need to loop thru all the characters, while keeping track of 3
           main variable result, curValue, sign. when found these character
            - '+' -> we need to add signed curValue to result
            - '-' -> we need to also add signed curValue to result
            - else -> we just keeps adding number to curValue
        2. to add all the remaining value in curValue we can simply add + sign
           at the end of string to trigger adding last number into result
           variable
        3. but the question state that '()' are also a valid character and we
           need to respect math operation where all number in side nees to be
           sum first then we can sum it out to external numbers
        4. So, we need to add condition to above list of condition before else
            - '(' -> we need to store result and sign we calculated so far (at
              this point the curValue will be 0 anyways since we just pass
              either + or - sign) then we edit the result and sign variable to
              default value waiting to store what ever result we will get
              inside the bracket
            - ')' -> this act as a trigger to do add curValue into result
              variable. then clean up sign and curValue to default state. and
              we need to convert the sign of this bracketed result we got from
              the sign value we stored previously. and then we can do another
              sum of bracketed result with the result we stored in stack to
              finally get the result up until current point
        5. keep going until finally we can return the result variable

    **Complexity** Time: O(n) Space: O(n) worst case we store everything in
    stack if we have nested bracket case

### Basic Calculator II

    _Default case_, if trim string gets empty return 0. if trim string get
    length 1 return that char - '0'

    **Solve**
        1. we need to loop thru all the characters, while keeping track of 3
           main variable result stack, curValue, literal sign. when found these
           character
            - ' ' -> whitespace ignore and keep going
            - digits -> we just keeps adding number to curValue
            - else -> this question handle the calculation quite differently
              than previous basic calculator, where the sign we stored is the
              sign before the curValue, so, when we need to do math just check
              the sign and do following
                - '+' -> just push curValue into stack
                - '-' -> push negative value into stack
                - '*' -> since matematic operation prioritize * and /, we need
                  to pop last value in stack to multiply with curValue and push
                  it back
                - '/' -> same with * we pop last value and do division with
                  curValue and push it bac
                then we just update sign to the current location and refresh
                curValue to wait for next sign
        2. to add all the remaining value in curValue we can simply add + sign
           at the end of string to trigger adding last number into result
           variable
        3. keep going until finally we can return the result.sum()

    **Complexity** Time: O(n) Space: O(n)

### Insert Delete GetRandom O(1)

    _Default case_, there is no default caes as the question is a data
    structure question
    

    **Solve**
        1. to achieve O(1) Time compleixty we need to have 2 data structure to
           holds the value, list and map
        2. list store what ever value we get from insert. map stored relative
           index in list where we insert that value. ultimately for insert and
           delete we use map to achieve O(1), list is to satisfy the getRandom
           function
        3. for each function, we implement it like this
            - insert ->> we insert what ever value into list and add
              value->index correlation into map. always do initial check if we
              have inserted the value before and return false if we have done
              so
            - delete ->> this is a bit more tricky, 1st we checked if we don't
              have value to remove just return false. otherwise, we need to
              first remove the value from the map then store the index in list
              that we removed. then we try remove last value in list, (if it's
              equals to val to be delete then that's that)
              but if not, then we need to replace that removed value back into
              the index of value we intended to remove. then we remap the
              value->index relationship in map accordingly
            - getRandom ->> we can just utilize 'kotlin.random.Random.nextInt'
              to get random index in the list to return

    **Complexity** Time:O(1) Space:O(n)

### Non-overlapping Intervals

    _Default case_, if the input size is 1 or less there's no need to repace
    anything

    **Solve**
        1. this is another variant of merge intervals insert intervals question
        2. to solve this we need to sort input array by value at index 1
        3. then we create 2 variable to store result and current max value
           (default at index 1 value of first value in intervals)
        4. for each iteration from index 1, keeps checking if we need to remove
           certain value by checking if index 0 value of that interval is less
           than curMax or not. else we just update curMax by checking the
           current value with value of index 1 in current interval

    **Complexity** Time: O(nlogn + n) Space: O(1)
