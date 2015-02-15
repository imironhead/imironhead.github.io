---
layout: post
title: "LeetCode: Multiply Strings"
description: ""
category:
tags: ["puzzle", "programming"]
---

Idea: implement an algorithm that works like how you multiply 2 integers on paper.

~~~ cpp
class Solution {
public:
  string multiply(string num1, string num2) {
    if ((num1 == string("0")) || (num2 == string("0"))) {
      return string("0");
    }

    if (num1 == string("1")) {
      return num2;
    }

    if (num2 == string("1")) {
      return num1;
    }

    vector<int> num(1);

    num[0] = 0;

    int a;
    int b;
    int i;
    int j;
    int d1;
    int d2;

    for (i = num2.size() - 1; i >= 0; --i) {
      d2 = num2.size() - 1 - i;

      b = 0;

      for (j = num1.size() - 1; j >= 0; --j) {
        d1 = num1.size() - 1 - j;

        if (d1 + d2 >= num.size()) {
          num.resize(d1 + d2 + 1, 0);
        }

        a = b + (num1[j] - '0') * (num2[i] - '0') + num[d1 + d2];

        if (a > 9) {
          b = a / 10;

          num[d1 + d2] = a % 10;
        } else {
          b = 0;

          num[d1 + d2] = a;
        }
      }

      if (b) {
        d1 += 1;

        if (d1 + d2 >= num.size()) {
          num.resize(d1 + d2 + 1, 0);
        }

        num[d1 + d2] = b;
      }
    }

    string ans("");

    for (int i = num.size() - 1; i >= 0; --i) {
      ans.append(1, '0' + num[i]);
    }

    return ans;
  }
};
~~~
