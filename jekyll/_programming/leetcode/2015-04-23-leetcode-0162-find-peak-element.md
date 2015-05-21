---
layout: post
title: "LeetCode 0162: Find Peak Element"
description: ""
category:
tags: ["puzzle", "programming"]
---

[Find Peak Element](https://leetcode.com/problems/find-peak-element/)

# cpp

~~~ cpp
class Solution {
public:
  int findPeakElement(vector<int>& nums) {
    int i = 0;
    int j = nums.size() - 1;
    int m;

    while (i < j) {
      m = (i + j) / 2;

      if (nums[m] < nums[m + 1]) {
        i = m + 1;
      } else {
        j = m;
      }
    }

    return i;
  }
};
~~~

# javascript

~~~ javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var findPeakElement = function(nums) {
  var i = 0;
  var j = nums.length - 1;
  var m;

  while (i < j) {
    m = Math.floor((i + j) / 2);

    if (nums[m] < nums[m + 1]) {
      i = m + 1;
    } else {
      j = m;
    }
  }

  return i;
};
~~~

# python

~~~ python
class Solution:
  # @param nums, an integer[]
  # @return an integer
  def findPeakElement(self, nums):
    i, j = 0, len(nums) - 1

    while i < j :
      m = (i + j) / 2

      if nums[m] < nums[m + 1] :
        i = m + 1
      else :
        j = m

    return i
~~~

# ruby

~~~ ruby
# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums)
  i, j = 0, nums.length - 1

  while i < j
    m = (i + j) / 2

    if nums[m] < nums[m + 1]
      i = m + 1
    else
      j = m
    end
  end

  i
end
~~~
