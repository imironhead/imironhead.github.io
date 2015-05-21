---
layout: post
title: "LeetCode 0209: Minimum Size Subarray Sum"
description: ""
category:
tags: ["puzzle", "programming"]
---


[Minimum Size Subarray Sum](https://leetcode.com/problems/minimum-size-subarray-sum/)

Use queue, push numbers into the queue one by one until the sum of all elements in the queue is greater or equal to s. Record the size of the queue, then pop the queue till the sum
is less than s.

# cpp

~~~ cpp
class Solution {
public:
  int minSubArrayLen(int s, vector<int>& nums) {
    queue<int>::size_type r(nums.size());
    queue<int>::size_type i(0), j(0), t(0);

    for (i = 0; i < nums.size(); ++i) {
      t += nums[i];

      while (j <= i && t >= s) {
        r = min(r, i - j + 1);

        t -= nums[j];

        j += 1;
      }
    }

    return (r == nums.size()) ? 0 : r;
  }
};
~~~

# javascript

~~~ javascript
/**
 * @param {number} s
 * @param {number[]} nums
 * @return {number}
 */
var minSubArrayLen = function(s, nums) {
  var r = nums.length, t = 0;
  var i, j;

  for (i = 0, j = 0; i < nums.length; ++i) {
    t += nums[i];

    while (j <= i && t >= s) {
      r = Math.min(r, i - j + 1);
      t -= nums[j];
      j += 1;
    }
  }

  return (r == nums.length) ? 0 : r;
};
~~~

# python

~~~ python
class Solution:
  # @param {integer} s
  # @param {integer[]} nums
  # @return {integer}
  def minSubArrayLen(self, s, nums):
    t, j, r = 0, 0, len(nums)

    for i, n in enumerate(nums) :
      t += n

      while j <= i and t >= s :
        r = min(r, i - j + 1)
        t -= nums[j]
        j += 1

    return 0 if r == len(nums) else r
~~~

# ruby

~~~ ruby
# @param {Integer} s
# @param {Integer[]} nums
# @return {Integer}
def min_sub_array_len(s, nums)
  j, t, r = 0, 0, nums.length

  nums.each_with_index do | n, i |
    t += n

    while t >= s and j <= i
      r = [r, i - j + 1].min
      t -= nums[j]
      j += 1
    end
  end

  r == nums.length ? 0 : r
end
~~~
