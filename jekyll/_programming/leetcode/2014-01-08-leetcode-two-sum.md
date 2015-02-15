---
layout: post
title: "LeetCode: Two Sum"
description: ""
category:
tags: ["puzzle", "programming"]
---

Given an array of integers, find two numbers such that they add up to a specific target number.

The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.

You may assume that each input would have exactly one solution.

Input: numbers={2, 7, 11, 15}, target=9

Output: index1=1, index2=2

* O(n) with hash map.

~~~ cpp
class Solution {
public:
  vector<int> twoSum(vector<int>& numbers, int target) {
    vector<int> ans(2);
    unordered_map<int, int> nums;

    // key of nums: value of i-th value in numbers
    // val of nums: i

    for (int i = 0; i < numbers.size(); ++i) {
      if (nums.count(target - numbers[i])) {
        // if numbers[i] + nums[target - numbers[i]] is exist
        // it's the answer

        ans[0] = 1 + nums[target - numbers[i]];
        ans[1] = 1 + i;

        break;
      } else {
        nums[numbers[i]] = i;
      }
    }

    return ans;
  }
};
~~~
