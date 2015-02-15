---
layout: post
title: "LeetCode: Roman to Integer"
description: ""
category:
tags: ["puzzle", "programming"]
---

Given a roman numeral, convert it to an integer.

Input is guaranteed to be within the range from 1 to 3999.

~~~ cpp
class Solution {
public:
  int helper(char c) {
    int v = 0;

    switch (c) {
      case 'I':	v = 1;    break;
      case 'V':	v = 5;    break;
      case 'X':	v = 10;   break;
      case 'L':	v = 50;   break;
      case 'C':	v = 100;  break;
      case 'D':	v = 500;  break;
      case 'M':	v = 1000; break;
    }

    return v;
  }

  int romanToInt(string s) {
    if (s.empty()) {
      return 0;
    }

    int ans = this->helper(s[0]);
    int m;
    int n;

    for (auto a = 1; a < s.size(); ++a) {
      m = this->helper(s[a - 1]);
      n = this->helper(s[a]);

      if ((a > 0) && (m < n)) {
        // IX, but I was added in previous iteration.
        ans += n - m - m;
      } else {
        ans += n;
      }
    }

    return ans;
  }
};
~~~
