# Leetcode question cheatsheet

## Easy

### Two Sum

    _Default case_, if the array size is 1 or below, return empty `IntArray`
    **Solve**
        1. Use either `MutableMap` or normal `Array` to stored key = remainder, value = index
        2. For each value `num` in nums, check if `num` is of any key in `MutableMap`, if yes build `IntArray` of value of that map and current index
        3. Default case, return empty `IntArray`

### Valid Parentheses

    _Default case_, if input string trimmed is empty, return `True`
    **Solve**
        1. Use Stack to collect opposite side of parentheses e.g. if found `(` then add `)` into stack
        2. If the character is not `[ { (`, then check if stack is empty or last value in stack doesn't match char, then it's not valid
        3. Last step, check if stack isEmpty, otherwise the string doesn't contains valid parentheses

