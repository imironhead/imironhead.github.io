---
layout: post
title: "LeetCode 0003: Longest Substring Without Repeating Characters"
description: ""
category:
tags: ["puzzle", "programming"]
---

[Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)

Given a string, find the length of the longest substring without repeating
characters. For example, the longest substring without repeating letters
for "abcabcbb" is "abc", which the length is 3. For "bbbbb" the longest
substring is "b", with the length of 1.

* O(n) with hash set.
* If only letters are used, replace hash set with bit flag.

suppose the substring is s[i:j]:

* ++i if there is repeating characters until there is no repeating characters in s[(i+n):j].
* ++j if there is no repeating characters until find one (repeating character).
s[i:j] is repeating characters free. Find the max length of s[i:j]


~~~ cpp
class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        bitset<256> mask;
        int length = -1;  // if s is ''

        string::size_type i = 0;
        string::size_type j = 0;

        for (i = 0; i < s.length(); ++i) {
            if (mask[s[i]]) {
                while (mask[s[i]]) {
                    mask[s[j]] = false;
                    j += 1;
                }
            } else {
                length = max(length, static_cast<int>(i - j));
            }

            mask[s[i]] = true;
        }

        return length + 1;
    }
};
~~~

# Python

~~~ python
class Solution:
    # @param {string} s
    # @return {integer}
    def lengthOfLongestSubstring(self, s):
        table = [False] * 256
        length = -1
        j = 0

        for i in range(len(s)) :
            c = ord(s[i])

            if table[c] :
                while table[c] :
                    table[ord(s[j])] = False
                    j += 1
            else :
                length = max(length, i - j)

            table[c] = True

        return length + 1
~~~

# Javascript

~~~ javascript
/**
 * @param {string} s
 * @return {number}
 */
var lengthOfLongestSubstring = function(s) {
    var table = [];
    var i, j, k = 0;
    var length = -1;

    while (k < 256) {
        table.push(false);
        k += 1;
    }

    j = 0;

    for (i = 0; i < s.length; ++i) {
        k = s.charCodeAt(i);

        if (table[k]) {
            while (table[k]) {
                table[s.charCodeAt(j)] = false;
                j += 1;
            }
        } else {
            length = Math.max(length, i - j)
        }

        table[k] = true;
    }

    return length + 1;
};
~~~


# Ruby
~~~ ruby
# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
    table = [false] * 256

    length = -1
    j = 0

    (0...s.length).each do | i |
        k = s[i].ord

        if table[k]
            while table[k] do
                table[s[j].ord] = false
                j += 1
            end
        else
            length = [length, i - j].max
        end

        table[k] = true
    end

    return length + 1
end
~~~
