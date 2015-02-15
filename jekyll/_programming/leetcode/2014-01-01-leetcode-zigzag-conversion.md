---
layout: post
title: "LeetCode: ZigZag Conversion"
description: ""
category:
tags: ["puzzle", "programming"]
---

The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

P   A   H   N

A P L S I I G

Y   I   R

And then read line by line: "PAHNAPLSIIGYIR"

Write the code that will take a string and make this conversion given a number of rows:

string convert(string text, int nRows);

convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".

* Cycle is 2 * nRows - 2. For example, "PAYPALISHIRING" with 3 rows, len("PAYP") = 2 * 3 - 2.


~~~ cpp
class Solution {
public:
  string convert(string s, int nRows) {
    if (0 >= nRows) {
      return string("");
    } else if (1 == nRows) {
      return s;
    }

    int k = nRows + nRows - 2;

    string ans("");

    int i = 0;
    int j;

    // first line
    while (i < s.length()) {
      ans.append(1, s[i]);

      i += k;
    }

    i = 1;
    j = k - 1;

    int m;
    int n;

    // interior lines. 2 characters a line.
    while (i < j) {
      m = i;
      n = j;

      while (true) {
        if (m >= s.length()) {
          break;
        }

        ans.append(1, s[m]);

        if (n >= s.length()) {
          break;
        }

        ans.append(1, s[n]);

        m += k;
        n += k;
      }

      i += 1;
      j -= 1;
    }

    // last line
    while (i < s.length()) {
      ans.append(1, s[i]);

      i += k;
    }

    return ans;
  }
};
~~~
