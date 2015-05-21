---
layout: post
title: "LeetCode 0168: Excel Sheet Column Title"
description: ""
category:
tags: ["puzzle", "programming"]
---


[Excel Sheet Column Title](https://leetcode.com/problems/excel-sheet-column-title/)


# cpp

~~~ cpp
class Solution {
public:
  string convertToTitle(int n) {
    string ans("");

    while (n) {
      ans = static_cast<char>('A' + (n - 1) % 26) + ans;

      n = (n - 1) / 26;
    }

    return ans;
  }
};
~~~

# javascript

~~~ javascript
/**
 * @param {number} n
 * @return {string}
 */
var convertToTitle = function(n) {
  var r = '';

  while (n > 0) {
    r = String.fromCharCode(65 + (n - 1) % 26) + r;

    n = Math.floor((n - 1) / 26);
  }

  return r;
};
~~~

# python

~~~ python
class Solution:
  # @param {integer} n
  # @return {string}
  def convertToTitle(self, n):
    r = ''

    while n > 0 :
      r = chr(ord('A') + (n - 1) % 26) + r

      n = (n - 1) / 26

    return r
~~~

# ruby

~~~ ruby
# @param {Integer} n
# @return {String}
def convert_to_title(n)
  r = ''

  until n.zero?
    r = ('A'.ord + (n - 1) % 26).chr + r

    n = (n - 1) / 26
  end

  r
end
~~~
