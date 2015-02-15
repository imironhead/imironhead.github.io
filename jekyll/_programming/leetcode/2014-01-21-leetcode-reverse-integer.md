---
layout: post
title: "LeetCode: Reverse Integer"
description: ""
category:
tags: ["puzzle", "programming"]
---

Reverse digits of an integer.

Example1: x = 123, return 321

Example2: x = -123, return -321

* No overflow is handled.
* There are many discussions on LeetCode about how to handle overflow, but most
of them are still not correct. They simply use long long to keep the result,
then detect if it's overflowed by check with maximum value of int. Why? If the
type of input is long long, you do not have "long long long long".
* Someone said he handled it by converting int to a string. It should work fine
(compare to predefined max int string alphabetically).

~~~ cpp
class Solution {
public:
  int reverse(int x) {
    int y = 0;

    bool minus;

    if (x < 0) {
      minus = true;

      x = -x;
    } else {
      minus = false;
    }

    while (x > 0) {
      y = 10 * y + x % 10;

      x /= 10;
    }

    if (minus) {
      y = -y;
    }

    return y;
  }
};
~~~
