---
layout: post
title: "LeetCode 0190: Reverse Bits"
description: ""
category:
tags: ["puzzle", "programming"]
---

[Reverse Bits](https://leetcode.com/problems/reverse-bits/)

# cpp

~~~ cpp
class Solution {
public:
  uint32_t reverseBits(uint32_t n) {
    uint32_t table[] = {
      0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15
    };

    uint32_t res = 0;

    for (auto i = 0; i < 8; ++i) {
      res <<= 4;
      res |= table[n & 15];
      n >>= 4;
    }

    return res;
  }
};
~~~

# javascript

[***Note that the bitwise operators and shift operators operate on 32-bit ints.***](http://stackoverflow.com/questions/307179/what-is-javascripts-highest-integer-value-that-a-number-can-go-to-without-losin)

~~~ javascript
/**
 * @param {number} n - a positive integer
 * @return {number} - a positive integer
 */
var reverseBits = function(n) {
  var r = 0;

  for (var i = 0; i < 32; ++i) {
    r += r;

    if (n % 2 == 1) {
      r += 1;
    }

    n = Math.floor(n / 2);
  }

  return r;
};
~~~

# python

~~~ python
class Solution:
  # @param n, an integer
  # @return an integer
  def reverseBits(self, n) :
    table = [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]

    res = 0

    for i in xrange(8) :
      res <<= 4
      res |= table[n & 15]
      n >>= 4

    return res
~~~

# ruby

~~~ ruby
# @param {Integer} n, a positive integer
# @return {Integer}
def reverse_bits(n)
  table = [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]

  res = 0

  8.times do
    res <<= 4
    res |= table[n & 15]
    n >>= 4
  end

  res
end
~~~
