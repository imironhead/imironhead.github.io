---
layout: post
title: "LeetCode 0191: Number of 1 Bits"
description: ""
category:
tags: ["puzzle", "programming"]
---

[Number of 1 Bits ](https://leetcode.com/problems/number-of-1-bits/)

# c

~~~ c
const int table[32] = {
  0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4, 1, 2, 2, 3, 2, 3, 3,
  4, 2, 3, 3, 4, 3, 4, 4, 5
};

int hammingWeight(uint32_t n) {
    int c = 0;

    while (n) {
        c += table[n & 31];
        n >>= 5;
    }

    return c;
}
~~~

# javascript

~~~ javascript
/**
 * @param {number} n - a positive integer
 * @return {number}
 */
var table = [
  0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4, 1, 2, 2, 3, 2, 3, 3, 4,
  2, 3, 3, 4, 3, 4, 4, 5
];

var hammingWeight = function(n) {
    var c = 0;

    if (n >= 2147483648) {
        c = 1;
        n -= 2147483648;
    }

    while (n > 0) {
        c += table[n & 31];
        n >>= 5;
    }

    return c;
};
~~~

# python

~~~ python
class Solution:
    TABLE = [0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, \
    4, 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5];

    # @param n, an integer
    # @return an integer
    def hammingWeight(self, n) :
        c = 0

        while n > 0 :
            c += Solution.TABLE[n & 31]
            n >>= 5

        return c
~~~

# ruby

~~~ ruby
# @param {Integer} n, a positive integer
# @return {Integer}
def hamming_weight(n)
    table = [
        0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4,
        1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5
    ]

    c = 0

    until n.zero?
        c += table[n & 31]
        n >>= 5
    end

    c
end
~~~
