---
layout: post
title: "LeetCode: Longest Common Prefix"
description: ""
category:
tags: ["puzzle", "programming"]
---

Write a function to find the longest common prefix string amongst an array of strings.

~~~ cpp
class Solution {
public:
  string longestCommonPrefix(vector<string>& strs) {
    if (strs.empty()) {
      return string("");
    }

    int i;

    bool done = true;

    for (i = 0; i < strs[0].length(); ++i) {
      for (auto& s : strs) {
        if ((i >= s.length()) || (s[i] != strs[0][i])) {
          done = false;

          break;
        }
      }

      if (!done) {
        break;
      }
    }

    return strs[0].substr(0, i);
  }
};
~~~
