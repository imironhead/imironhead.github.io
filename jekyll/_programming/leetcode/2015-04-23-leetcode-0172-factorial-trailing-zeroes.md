---
layout: post
title: "LeetCode 0172: Factorial Trailing Zeroes"
description: ""
category:
tags: ["puzzle", "programming"]
---


[Factorial Trailing Zeroes](https://leetcode.com/problems/factorial-trailing-zeroes/)

# cpp

~~~ cpp
class Solution {
public:
  int trailingZeroes(int n) {
    int c(0);

    while (n) {
      c += n / 5;
      n /= 5;
    }

    return c;
  }
};
~~~

# javascript

~~~ javascript
/**
 * @param {number} n
 * @return {number}
 */
var trailingZeroes = function(n) {
  var c = 0;

  while (n > 0) {
    n = Math.floor(n / 5);
    c += n;
  }

  return c;
};
~~~

# python

~~~ python
class Solution:
  # @param {integer} n
  # @return {integer}
  def trailingZeroes(self, n):
    c = 0

    while n > 0 :
      n /= 5
      c += n

    return c
~~~

# ruby

~~~ ruby
# @param {Integer} n
# @return {Integer}
def trailing_zeroes(n)
  c = 0

  until n.zero?
    n /= 5
    c += n
  end

  c
end
~~~
