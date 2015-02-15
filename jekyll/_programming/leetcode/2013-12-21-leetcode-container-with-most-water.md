---
layout: post
title: "LeetCode: Container With Most Water"
description: ""
category:
tags: ["puzzle", "programming"]
---

Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

Note: You may not slant the container.

~~~ cpp
class Solution {
public:
  int maxArea(vector<int> &height) {
    // empty container
    if (height.size() < 2) {
      return 0;
    }

    // only two lines
    if (height.size() == 2) {
      return min(height[0], height[1]);
    }

    int i = 0;
    int j = height.size() - 1;
    int a = 0;

    while (i < j) {
      a = max(a, (j - i) * min(height[j], height[i]));

      // change the index of lower line to find larger container.
      // it's impossible to find larger container if the higher line is changed.
      if (height[i] < height[j]) {
        i += 1;
      } else {
        j -= 1;
      }
    }

    return a;
  }
};
~~~
