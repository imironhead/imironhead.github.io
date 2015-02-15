---
layout: post
title: "LeetCode: Maximum Product Subarray"
description: ""
category:
tags: ["puzzle", "programming"]
---

I have read this answer before (spoiled :) ).
- compute product from left most to right most, keep the max value.
- compute product from right most to left most, keep the max value.
- the max value of them is the answer.
- if the product is minus during computing, it will be smaller and smaller.
- a minus product may become positive if is multiplied with a minus number.
- reset if there is a zero.

~~~ cpp
class Solution {
public:
  int maxProduct(int A[], int n) {
    if (n == 0) {
      return 0;
    }

    int m = A[0];
    int p = 0;

    for (int i = 0; i < n; ++i) {
      if (p == 0) {
        // if the product is 0, reset it.
        p = A[i];
      } else {
        p *= A[i];
      }

      m = max(m, p);
    }

    p = 0;

    for (int i = n - 1; i >= 0; --i) {
      if (p == 0) {
        p = A[i];
      } else {
        p *= A[i];
      }

      m = max(m, p);
    }

    return m;
  }
};
~~~
