---
layout: post
title: "LeetCode 0198: House Robber"
description: ""
category:
tags: ["puzzle", "programming"]
---

[House Robber](https://leetcode.com/problems/house-robber/)

# cpp

~~~ cpp
class Solution {
public:
  int rob(vector<int>& nums) {
    int a(0), b(0), c(0), s;

    for (auto& n : nums) {
      s = n + max(a, b);

      a = b;
      b = c;
      c = s;
    }

    return max(b, c);
  }
};
~~~

# javascript

~~~ javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var rob = function(nums) {
  var a = 0, b = 0, c = 0, t;

  for (var i = 0; i < nums.length; ++i) {
    t = nums[i] + Math.max(a, b);

    a = b;
    b = c;
    c = t;
  }

  return Math.max(b, c);
};
~~~

# python

~~~ python
class Solution:
    # @param {integer[]} nums
    # @return {integer}
    def rob(self, nums):
        a, b, c = 0, 0, 0

        for n in nums :
            s = n + max(a, b)
            a, b, c = b, c, s

        return max(b, c)
~~~

# ruby

~~~ ruby
# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  a, b, c = 0, 0, 0

  nums.each do | n |
    a, b, c = b, c, n + [a, b].max
  end

  [b, c].max
end
~~~
