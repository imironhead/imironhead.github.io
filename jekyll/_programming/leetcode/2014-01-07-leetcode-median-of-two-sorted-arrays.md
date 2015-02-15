---
layout: post
title: "LeetCode: Median of Two Sorted Arrays"
description: ""
category:
tags: ["puzzle", "programming"]
---

Idea: If MedianOf(A) < MedianOf(B), then all elements less than MedianOf(A) in A
are less then the media of two sorted arrays. Let's divide and conquer!!!

~~~ cpp
class Solution {
public:
  int findKthElement(int A[], int m, int B[], int n, int k) {
    if (m <= 0) {
      return B[k - 1];
    }

    if (n <= 0) {
      return A[k - 1];
    }

    if (k <= 1) {
      return min(A[0], B[0]);
    }

    int _m = m / 2;
    int _n = n / 2;

    if (_m + _n + 2 <= k) {
      if (A[_m] < B[_n]) {
        return this->findKthElement(A + _m + 1, m - _m - 1, B, n, k - _m - 1);
      } else {
        return this->findKthElement(A, m, B + _n + 1, n - _n - 1, k - _n - 1);
      }
    } else {
      if (A[_m] < B[_n]) {
        return this->findKthElement(A, m, B, _n, k);
      } else {
        return this->findKthElement(A, _m, B, n, k);
      }
    }
  }

  double findMedianSortedArrays(int A[], int m, int B[], int n) {
    int s = m + n;

    if (0 == s) {
      return 0.0;
    } else if (s & 1) {
      // if s is odd, the (s / 2 + 1)th value is the median
      return this->findKthElement(A, m, B, n, s / 2 + 1);
    } else {
      // if s is even, the average of [s / 2] and [s / 2 + 1] is the median
      return 0.5 * static_cast<double>(
        this->findKthElement(A, m, B, n, s / 2) +
        this->findKthElement(A, m, B, n, s / 2 + 1));
    }
  }
};
~~~
