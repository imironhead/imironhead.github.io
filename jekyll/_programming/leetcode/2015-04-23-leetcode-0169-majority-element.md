---
layout: post
title: "LeetCode 0169: Majority Element"
description: ""
category:
tags: ["puzzle", "programming"]
---


[Majority Element](https://leetcode.com/problems/majority-element/)

# cpp

~~~ cpp
class Solution {
public:
  int majorityElement(vector<int>& nums) {
    int c = 1;
    int m = nums[0];

    for (auto i = 1; i < nums.size(); ++i) {
      if (nums[i] == m) {
        c += 1;
      } else if (c == 1) {
        m = nums[i];
      } else {
        c -= 1;
      }
    }

    return m;
  }
};
~~~

# javascript

~~~ javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var majorityElement = function(nums) {
  var m = nums[0];
  var c = 1;

  for (var i = 1; i < nums.length; ++i) {
    if (m == nums[i]) {
      c += 1;
    } else if (c == 1) {
      m = nums[i];
    } else {
      c -= 1;
    }
  }

  return m;
};
~~~

# python

~~~ python
class Solution:
  # @param {integer[]} nums
  # @return {integer}
  def majorityElement(self, nums):
    m, c = 1 + nums[0], 1

    for n in nums :
      if n == m :
        c += 1
      elif c == 1 :
        m = n
      else :
        c -= 1

    return m
~~~

# ruby

~~~ ruby
# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  m, c = 1 + nums[0], 1

  nums.each do | n |
    if m == n
      c += 1
    elsif c == 1
      m = n
    else
      c -= 1
    end
  end

  m
end
~~~

As always, found a better solution in the forum. Though complexity of both algorithms
are linear, mine is more memory non-efficient (below).

~~~ ruby
# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  m = nums.length / 2

  table = Hash.new(0)

  nums.each { |n| table[n] += 1 }

  table.each { | k, v | return k if v > m }
end
~~~
