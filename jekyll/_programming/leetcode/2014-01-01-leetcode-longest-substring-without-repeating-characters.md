---
layout: post
title: "LeetCode: Longest Substring Without Repeating Characters"
description: ""
category:
tags: ["puzzle", "programming"]
---

Given a string, find the length of the longest substring without repeating
characters. For example, the longest substring without repeating letters
for "abcabcbb" is "abc", which the length is 3. For "bbbbb" the longest
substring is "b", with the length of 1.

* O(n) with hash set.
* If only letters are used, replace hash set with bit flag.

suppose the substring is s[i:j]:

* ++i if there is repeating characters until there is no repeating characters in s[(i+n):j].
* ++j if there is no repeating characters until find one (repeating character).
s[i:j] is repeating characters free. Find the max length of s[i:j]


~~~ cpp
class Solution {
public:
  int lengthOfLongestSubstring(string s) {
    if (s.empty()) {
      return 0;
    }
    if (s.length() == 1) {
      return 1;
    }

    int m = 1;  // max length
    int i = 0;  // head of longest substring without repeating characters
    int j = 1;  // tail of longest substring without repeating characters

    unordered_set<char> table;

    table.insert(s[0]);

    while (j < s.length()) {
      if (table.count(s[j])) {
        // remove s[i] if s[i] == s[j]
        table.erase(s[i]);

        i += 1;
      } else {
        table.insert(s[j]);

        j += 1;

        // s[i:j] is repeating characters free
        // size of table is current length of valid substring
        m = max(m, static_cast<int>(table.size()));
      }
    }

    return m;
  }
};
~~~
