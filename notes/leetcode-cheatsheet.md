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

### Valid Parentheses

    _Default case_, if input string trimmed is empty, return `True` 

    **Solve**
        1. Use Stack to collect opposite side of parentheses e.g. if found `(`
           then add `)` into stack
        2. If the character is not `[ { (`, then check if stack is empty or
           last value in stack doesn't match char, then it's not valid
        3. Last step, check if stack isEmpty, otherwise the string doesn't
           contains valid parentheses

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

### Valid Palindrome

    _Default case_, check if input string trimmed is of length 1 or less, if
    yes then it's a palindrome

    **Solve**
        1. create variable left and right to keep track of index window in string
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
        is palindrome
        extra: if we want to do functional way, we can also do filter function
        to cleanup any non letter or digit character and just do clean loop to
        compare. but it will take longer time since we need to go into a loop 2
        times

### Invert Binary Tree

    _Default case_, if root is null then just return root

    **Solve**
        1. For each node from root, swap left and right branch of it.
        2. then run the same function on left and right branch

### Valid Anagram

    _Default case_, if 2 string doesn't have the same length then it's always
    false, and if one of the string is empty then it's always true since both
    string now should have same length

    **Solve**
        1. Use map to store key = character, value = occurance in first string
        2. loop through each character in second string, and reduce the number
           of occurance in first string, if occurance is <= 0 then remove that
           key from map
        3. if character is not in a map then it's not an anagram, then just
           return false
        4. lastly check if there's any remaining key inside map, if there is
           then it's not an anagram, otherwise it is

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
        3. In main function, just call this helper function once on image[sr][sc]
        4. return the fill image

### Lowest Common Ancestor (LCA) of a Binary Search Tree

    _Default case_, if either of root, node p, or node q is null, then root is
    LCA of that tree

    **Solve**
        1. try to check if value at current root is greater than both value of
           node p and q, if yes, LCA should be at the left side of the tree
        2. check the same way but if value at root is lesser than both value of
           node p and q, then LCA needs to be right side of the tree
        3. otherwise, root is actually already a LCA of that tree

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
