# Leetcode question cheatsheet

## Easy

### Two Sum
1. Base case, if the array size is 1 or below, return empty `IntArray`
2. Use either `MutableMap` or normal `Array` to stored key = remainder, value = index
3. For each value `num` in nums, check if `num` is of any key in `MutableMap`, if yes build `IntArray` of value of that map and current index
4. Default case, return empty `IntArray`
