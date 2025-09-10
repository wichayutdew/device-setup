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

    _Default case_, if input string trimmed is empty, return `True` **Solve**
        1. Use Stack to collect opposite side of parentheses e.g. if found `(`
           then add `)` into stack
        2. If the character is not `[ { (`, then check if stack is empty or last
           value in stack doesn't match char, then it's not valid
        3. Last step, check if stack isEmpty, otherwise the string doesn't
           contains valid parentheses

### Merge Two Sorted Lists

    _Default case_, if both `LinkedList` are null, return null. Otherwise, if
    one of it is null, return other one **Solve**
        1. create new variable to track head of new LinkedList, e.g. `val head:
           LinkList? = LinkList(0)`, this will be uses as temp head to return
           the result `LinkList`
        2. create variable temp to track from head created above, another
           iterator for list1 and list2 respectively
        3. do while loop when iterator for both list1 and list2 are not null,
           check value from each list, if it's less/equals add it into next node
           of temp. then move temp and iterator of that list forward
        4. after getting out of the loop, we will leave with 1 empty iterator,
           and another iterator with remaining nodes with value greater than the
           remaining iterator, then we can attach next node of temp to that
           iterator and return the node after head tracker created in step 1
