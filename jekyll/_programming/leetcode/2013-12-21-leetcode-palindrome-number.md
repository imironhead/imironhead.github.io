---
layout: post
title: "LeetCode: Palindrome Number"
description: ""
category:
tags: ["puzzle", "programming"]
---

* Again, many discussions about overflow handling on forum of LeetCode.

tyuan73's brilliant solution: Reverse the integer digit by digit.
For example,

* 12344321
* (1234432, 1)
* (123443, 12)
* (12344, 123)
* (1234, 1234) => palindromic

~~~ cpp
// my first implementation, overflow is not handled.
class Solution {
public:
  bool isPalindrome(int x) {
    if (x < 0) {
      return false;
    }

    int a = x;
    int b = 0;

    while (a) {
      b = b * 10 + a % 10;

      a /= 10;
    }

    return x == b;
  }
};
~~~
