---
layout: post
title: "LeetCode: Integer to Roman"
description: ""
category:
tags: ["puzzle", "programming"]
---

Given an integer, convert it to a roman numeral.

Input is guaranteed to be within the range from 1 to 3999.

~~~ cpp
class Solution {
public:
  string intToRoman(int num) {
    // invalid
    if (0 >= num) {
      return string("");
    }

    string s("");

    int basen[] = {1000, 500, 100, 50, 10, 5, 1, 0};
    char basec[] = {'M', 'D', 'C', 'L', 'X', 'V', 'I'};

    int b = 1;
    int k;

    if (num >= 1000) {
      k = num / basen[0];

      s.append(k, basec[0]);

      num -= k * basen[0];
    }

    while (b < 7) {
      // basen[b + 1] is 10 ^ n
      // basen[b    ] is 5 * (10 * n)

      k = num / basen[b + 1];

      if (9 == k) {
        // IX
        s.append(1, basec[b + 1]);
        s.append(1, basec[b - 1]);
      } else if (4 == k) {
        // IV
        s.append(1, basec[b + 1]);
        s.append(1, basec[b]);
      } else {
        // VII or II
        if (k >= 5) {
          s.append(1, basec[b]);

          num -= 5 * basen[b + 1];

          k -= 5;
        }

        s.append(k, basec[b + 1]);
      }

      num -= k * basen[b + 1];

      b += 2;
    }

    return s;
  }
};
~~~
