---
layout: post
title: "LeetCode 0155: Min Stack"
description: ""
category:
tags: ["puzzle", "programming"]
---

[Min Stack](https://leetcode.com/problems/min-stack/)

# cpp

~~~ cpp
class MinStack {
  stack<pair<int, int>> container;

public:
  void push(int x) {
    if (this->container.empty()) {
      this->container.push(make_pair(x, x));
    } else {
      this->container.push(make_pair(x, min(x, this->container.top().second)));
    }
  }

  void pop() {
    if (!this->container.empty()) {
      this->container.pop();
    }
  }

  int top() {
    if (this->container.empty()) {
      return 0;
    } else {
      return this->container.top().first;
    }
  }

  int getMin() {
    if (this->container.empty()) {
      return 0;
    } else {
      return this->container.top().second;
    }
  }
};
~~~

# javascript

~~~ javascript
/**
 * @constructor
 */
var MinStack = function() {
  this.stack = [];
};

/**
 * @param {number} x
 * @returns {void}
 */
MinStack.prototype.push = function(x) {
  var min = x;

  if (this.stack.length > 0) {
    min = Math.min(x, this.stack[this.stack.length - 1][1]);
  }

  this.stack.push([x, min]);
};

/**
 * @returns {void}
 */
MinStack.prototype.pop = function() {
  if (this.stack.length > 0) {
    this.stack.pop();
  }
};

/**
 * @returns {number}
 */
MinStack.prototype.top = function() {
  if (this.stack.length > 0) {
    return this.stack[this.stack.length - 1][0];
  } else {
    return 0;
  }
};

/**
 * @returns {number}
 */
MinStack.prototype.getMin = function() {
  if (this.stack.length > 0) {
    return this.stack[this.stack.length - 1][1];
  } else {
    return 0;
  }
};
~~~

# python

~~~ python
class MinStack:
  def __init__(self) :
    self.stack = []

  # @param x, an integer
  # @return an integer
  def push(self, x) :
    m = x

    if len(self.stack) > 0 :
      m = min(x, self.stack[-1][1])

    self.stack.append([x, m])

  # @return nothing
  def pop(self) :
    if len(self.stack) > 0 :
      del self.stack[-1]


  # @return an integer
  def top(self) :
    if len(self.stack) > 0 :
      return self.stack[-1][0]
    else :
      return 0

  # @return an integer
  def getMin(self) :
    if len(self.stack) > 0 :
      return self.stack[-1][1]
    else :
      return 0
~~~
