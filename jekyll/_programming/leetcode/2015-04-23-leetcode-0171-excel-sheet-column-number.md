---
layout: post
title: "LeetCode 0171: Excel Sheet Column Number"
description: ""
category:
tags: ["puzzle", "programming"]
---


[Excel Sheet Column Number](https://leetcode.com/problems/excel-sheet-column-number/)

# cpp

~~~ cpp
class Solution {
public:
  int titleToNumber(string s) {
    int n(0), k(1);

    for (auto c = s.rbegin(); c != s.rend(); ++c) {
      n += k * (1 + *c - 'A');
      k *= 26;
    }

    return n;
  }
};
~~~

# javascript

~~~ javascript
/**
 * @param {string} s
 * @return {number}
 */
var titleToNumber = function(s) {
  var k = 1, n = 0;

  for (var i = s.length - 1; i >= 0; --i) {
    n += k * (1 + s.charCodeAt(i) - 65);
    k *= 26;
  }

  return n;
};
~~~

# python

~~~ python
class Solution:
  # @param {string} s
  # @return {integer}
  def titleToNumber(self, s) :
    n, k = 0, 1

    for c in reversed(s) :
      n += k * (1 + ord(c) - ord('A'))
      k *= 26

    return n
~~~

# ruby

~~~ ruby
# @param {String} s
# @return {Integer}
def title_to_number(s)
  n, k = 0, 1

  s.reverse.each_char do | c |
    n += k * (1 + c.ord - 'A'.ord)
    k *= 26
  end

  n
end
~~~
