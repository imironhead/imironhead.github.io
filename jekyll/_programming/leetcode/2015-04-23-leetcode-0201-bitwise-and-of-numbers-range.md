---
layout: post
title: "LeetCode 0201: Bitwise AND of Numbers Range "
description: ""
category:
tags: ["puzzle", "programming"]
---


[Happy Number](https://leetcode.com/problems/happy-number/)


# cpp

My original version. The basic idea is to check the most significant bits. If they
are different, the zero must be zero (0010xxxx >= 00100000 > 0001xxxx). If they
are the same, the most significant bit remains. Keep doing this recursively gives
the result (Passing im should be more efficient).

~~~ cpp
class Solution {
public:
    int rangeBitwiseAnd(int m, int n) {
        if (m == 0 || n == 0) {
            return 0;
        }

        int im = 1073741824;
        int in = 1073741824;

        while (!(m & im)) {
            im >>= 1;
        }

        while (!(n & in)) {
            in >>= 1;
        }

        return ((im == in) ? (im  | rangeBitwiseAnd(m & ~im, n & ~in)) : 0);
    }
};
~~~

# cpp again

There are always some better solutions in the forum. I found this one:

~~~ cpp
class Solution {
public:
    int rangeBitwiseAnd(int m, int n) {
        while (n > m) {
            n = n & (n - 1);
        }

        return n;
    }
};
~~~

Why???

~~~ console
n: 001011xxxxx
m: 001010xxxxx

if m < n, m <= n - 1 < n is always true. Which means n & (n - 1) is
part of those bitwise operations.

=> n & (n-1) remove the least significant bit from n !!!

n:       0010110000
n-1:     0010101111
n&(n-1): 0010100000

keep doing this, the n is always greater then or equals to m. When n is not
greater than m, n is the the answer.

if n equals to m, and m <= o <= n
n: 00101xxxx
o: 00101yyyy
m: 00101zzzz

if the most significant bit of n and m are diferent =>
n: 0011xxxx
m: 0001xxxx
n & (n - 1) keep producing new n that is greater than m until n become 0.
The answer is also 0.
~~~

yet another c solution, binary search the first different bit:

~~~ c
int rangeBitwiseAnd(int m, int n) {
    if (m == n) {
        return n;
    }

    int im = 0;
    int in = 31;
    int ii;

    while (in >= im + 2) {
        ii = (im + in) >> 1;

        if ((m >> ii) == (n >> ii)) {
            in = ii;
        } else {
            im = ii;
        }
    }

    return (n >> in) << in;
}
~~~

# python

~~~ python
class Solution:
    # @param m, an integer
    # @param n, an integer
    # @return an integer
    def rangeBitwiseAnd(self, m, n):
        while n > m :
            n = n & (n - 1)

        return n
~~~

# javascript

~~~ javascript
/**
 * @param {number} m
 * @param {number} n
 * @return {number}
 */
var rangeBitwiseAnd = function(m, n) {
    while (n > m) {
        n &= (n - 1);
    }

    return n;
};
~~~

# ruby

~~~ ruby
# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def range_bitwise_and(m, n)
    n &= (n - 1) until n <= m
    n
end
~~~
