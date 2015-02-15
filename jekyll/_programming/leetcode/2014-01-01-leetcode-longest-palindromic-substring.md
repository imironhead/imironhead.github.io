---
layout: post
title: "LeetCode: Longest Palindromic Substring"
description: ""
category:
tags: ["puzzle", "programming"]
---

Given a string S, find the longest palindromic substring in S. You may assume that the maximum length of S is 1000, and there exists one unique longest palindromic substring.

* Dynamic programming.
* If s[i:j] is palindromic, s[i-1:j+1] is palindromic if s[i-1] == j[j]
* If s[i:j] is not palindromic, s[i-1:j+1] is also not palindromic.

~~~ cpp
class Solution {
public:
  string longestPalindrome(string s) {
    if (s.length() <= 1) {
      return s;
    }

    int m = 1;
    pair<int, int> sub = make_pair(0, 0);
    vector<int> dp(s.length(), 0);

    dp[0] = 1;

    for (int i = 1; i < s.length(); ++i) {
      for (int j = i; j >= 2; --j) {
        if (dp[j - 2] && (s[i] == s[i - j])) {
          dp[j] = 1;

          if (m < j + 1) {
            m = j + 1;

            sub.first = i - j;
            sub.second = i;
          }
        } else {
          dp[j] = 0;
        }
      }

      if (s[i] == s[i - 1]) {
        dp[1] = 1;

        if (m < 2) {
          m = 2;

          sub.first = i - 1;
          sub.second = i;
        }
      } else {
        dp[1] = 0;
      }
    }

    return s.substr(sub.first, sub.second - sub.first + 1);
  }
};
~~~
