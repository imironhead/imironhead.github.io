---
layout: post
title: "LeetCode: Reverse Words in a String"
description: ""
category:
tags: ["puzzle", "programming"]
---

In place idea: reverse string, than reverse each word.

~~~ cpp
class Solution {
public:
  void reverseWords(string& s) {
    string t = "";

    string::size_type i = 0;
    string::size_type j = 0;

    while (true) {
      i = s.find_first_not_of(' ', j);

      // no more words
      if (i == string::npos) {
        break;
      }

      // a word in [i:j]
      j = s.find_first_of(' ', i);

      // the last word, not ended with spaces
      if (j == string::npos) {
        j = s.length();
      }

      // prepend space if there are words in t
      if (t.length() == 0) {
        t = s.substr(i, j - i);
      } else {
        t = s.substr(i, j - i) + string(" ") + t;
      }
    }

    s = t;
  }
};
~~~
