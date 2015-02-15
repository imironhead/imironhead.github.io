---
layout: post
title: "LeetCode: Evaluate Reverse Polish Notation"
description: ""
category:
tags: ["puzzle", "programming"]
---

Idea: Use stack.

~~~ cpp
class Solution {
public:
  int evalRPN(vector<string> &tokens) {
    stack<int> s;

    int tmp = 0;

    for (auto& t : tokens) {
      if (t == "+") {
        // an operator, compute the top most two integers and
        // put it on the top of the stack
        tmp = s.top();

        s.pop();

        s.top() += tmp;
      } else if (t == "-") {
        tmp = s.top();

        s.pop();

        s.top() -= tmp;
      } else if (t == "*") {
        tmp = s.top();

        s.pop();

        s.top() *= tmp;
      } else if (t == "/") {
        tmp = s.top();

        s.pop();

        s.top() /= tmp;
      } else {
        // an integer, push it into stack
        s.push(atoi(t.c_str()));
      }
    }

    return s.top();
  }
};
~~~
