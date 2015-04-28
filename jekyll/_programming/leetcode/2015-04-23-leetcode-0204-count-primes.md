---
layout: post
title: "LeetCode 0204: Count Primes"
description: ""
category:
tags: ["puzzle", "programming"]
---

[Count Primes](https://leetcode.com/problems/count-primes/)

# cpp

~~~ cpp
class Solution {
public:
    int countPrimes(int n) {
        vector<char> sieve(n, 1);
        int count = 0;

        for (auto i = 2; i < sieve.size(); ++i) {
            if (sieve[i]) {
                for (auto j = i; j < sieve.size(); j += i) {
                    sieve[j] = 0;
                }

                count += 1;
            }
        }

        return count;
    }
};
~~~

# python

~~~ python
# !!! use xrange, not range, to reduce memory usage.
class Solution:
    # @param {integer} n
    # @return {integer}
    def countPrimes(self, n):
        sieve = [False] * n

        count = 0

        for i in xrange(2, n) :
            if not sieve[i] :
                count += 1

                for j in xrange(i, n, i) :
                    sieve[j] = True

        return count
~~~

# javascript

~~~ javascript
/**
 * @param {number} n
 * @return {number}
 */
var countPrimes = function(n) {
    var sieve = new Array(n);
    var count = 0;

    sieve.map(function(m) { return false; });

    for (var i = 2; i < n; ++i) {
        if (!sieve[i]) {
            count += 1;

            for (var j = i; j < n; j += i) {
                sieve[j] = true;
            }
        }
    }

    return count;
};
~~~

# ruby

~~~ ruby
# @param {Integer} n
# @return {Integer}
def count_primes(n)
    count = 0

    numbers = Array.new(n, false)

    (2...n).each do | m |
        unless numbers[m]
            count += 1

            (m...n).step(m).each { | o | numbers[o] = true }
        end
    end

    count
end
~~~
