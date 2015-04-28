---
layout: post
title: "LeetCode 0202: Happy Number"
description: ""
category:
tags: ["puzzle", "programming"]
---


[Happy Number](https://leetcode.com/problems/happy-number/)


# CPP

~~~ cpp
class Solution {
public:
    int next(int n) {
        int s = 0;
        int t = 0;

        while (n > 0) {
            t = n % 10;
            n = n / 10;
            s = s + t * t;
        }

        return s;
    }

    bool isHappy(int n) {
        unordered_set<int> table;

        while (true) {
            if (n == 1) {
                return true;
            }

            if (table.find(n) != table.end()) {
                return false;
            }

            table.insert(n);

            n = next(n);
        }

        return false;
    }
};
~~~


# Python
~~~python
def generate_digit(n) :
    while n > 0 :
        yield n % 10
        n /= 10

class Solution:
    # @param {integer} n
    # @return {boolean}
    def isHappy(self, n):
        table = set()

        while True :
            if n == 1 :
                return True

            if n in table :
                return False

            table.add(n)

            n = reduce(lambda a, x: a + x * x, [d for d in generate_digit(n)], 0)
~~~


# Javascript
~~~javascript
/**
 * @param {number} n
 * @return {boolean}
 */
function next_n(n) {
    var s = 0;
    var t;

    while (n >= 1) {
        t = n % 10;
        n = Math.floor(n / 10);
        s = s + t * t;
    }

    return s;
}

var isHappy = function(n) {
    var table = {};

    while (true) {
        if (n == 1) {
            return true;
        }

        if (n.toString() in table) {
            return false;
        }

        table[n.toString()] = true;

        n = next_n(n);
    }

    return false;
};
~~~


# Ruby
~~~ ruby
# @param {Integer} n
# @return {Boolean}
def next_n(n)
    s = 0

    until n == 0 do
        t = n % 10
        n = n / 10
        s = s + t * t
    end

    s
end

def is_happy(n)
    table = {}

    loop do
        return true if n == 1
        return false if table.has_key? n

        table[n] = true

        n = next_n(n)
    end

    false
end
~~~
