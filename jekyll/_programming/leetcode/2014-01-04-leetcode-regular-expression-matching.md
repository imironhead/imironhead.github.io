---
layout: post
title: "LeetCode: Regular Expression Matching"
description: ""
category:
tags: ["puzzle", "programming"]
---

Implement regular expression matching with support for '.' and '*'.

* '.' Matches any single character.
* '*' Matches zero or more of the preceding element.

The matching should cover the entire input string (not partial).

The function prototype should be:

bool isMatch(const char *s, const char *p)

Some examples:

* isMatch("aa","a") → false
* isMatch("aa","aa") → true
* isMatch("aaa","aa") → false
* isMatch("aa", "a*") → true
* isMatch("aa", ".*") → true
* isMatch("ab", ".*") → true
* isMatch("aab", "c*a*b") → true

~~~ cpp
class Solution {
public:
  bool isMatch(const char *s, const char *p) {
    // if the pattern is ended, they are match only if the string is also ended.
    if (!*p) {
      return !*s;
    }

    // if there is only one character in the pattern,
    // or the 2nd character in the pattern is not '*' :
    if (!p[1] || (p[1] != '*')) {
      // they are match if:
      // - the 1st character of both strings are the same.
      // - the remain strings (sub-string without the 1st character) are matched.

      return (*s && ((*s == *p) || ('.' == *p))) && this->isMatch(s + 1, p + 1);
    }

    // in this stage, the pattern is began with 'x*' or '.*' (x can be
    // any other character).

    // if the 'x*' pattern is skipped
    if (this->isMatch(s, p + 2)) {
      return true;
    }

    // try to match:
    // => abcdefX : .*X
    // => yyyyyyX : y*X
    while (*s && ((*s == *p) || ('.' == *p))) {
      if (this->isMatch(s + 1, p + 2)) {
        return true;
      }

      s += 1;
    }

    return false;
  }
};
~~~
