---
layout: post
title: "LeetCode: String to Integer (atoi)"
description: ""
category:
tags: ["puzzle", "programming"]
---

* I do not like this kind of problems. When a programmer implements this,
he should has a spec in hand.

~~~ cpp
class Solution {
public:
  int atoi(const char *str) {
    if (!str || !str[0]) {
      return 0;
    }

    while (*str == ' ') {
      str += 1;
    }

    bool minus = (str[0] == '-');

    long long num = 0;

    if ((str[0] < '0') || (str[0] > '9')) {
      if ((*str != '+') && (*str != '-')) {
        return 0;
      }

      str += 1;
    }

    if (!(*str >= '0' && *str <= '9')) {
      return 0;
    }

    while (*str && ((*str >= '0') && (*str <= '9'))) {
      num = num * 10 + *str - '0';

      str += 1;

      if (num >= 2147483648) {
        num = minus ? 2147483648 : 2147483647;

        break;
      }
    }

    return minus ? -static_cast<int>(num) : static_cast<int>(num);
  }
};
~~~
