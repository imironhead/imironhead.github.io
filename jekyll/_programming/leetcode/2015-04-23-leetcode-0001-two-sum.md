---
layout: post
title: "LeetCode 0001: Two Sum"
description: ""
category:
tags: ["puzzle", "programming"]
---

[Two Sum](https://leetcode.com/problems/two-sum/)

Given an array of integers, find two numbers such that they add up to a specific target number.

The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.

You may assume that each input would have exactly one solution.

Input: numbers={2, 7, 11, 15}, target=9

Output: index1=1, index2=2

* O(n) with hash map.


# CPP

~~~ cpp
class Solution {
public:
    vector<int> twoSum(vector<int> &numbers, int target) {
        vector<int> ans(2);
        unordered_map<int, int> table;
        unordered_map<int, int>::iterator iTemp;

        for (int i = 0; i < numbers.size(); ++i) {
            iTemp = table.find(target - numbers[i]);

            if (iTemp == table.end()) {
                table[numbers[i]] = i;
            } else {
                ans[0] = 1 + iTemp->second;
                ans[1] = 1 + i;

                break;
            }
        }

        return ans;
    }
};
~~~


# Python
~~~ python
class Solution:
    # @return a tuple, (index1, index2)
    def twoSum(self, num, target):
        table = {}
        ans = (0, 0)

        for x in range(len(num)) :
            if (target - num[x]) in table :
                ans = (1 + table[target - num[x]], 1 + x)
                break
            else :
                table[num[x]] = x

        return ans
~~~

# Javascript
~~~ javascript
/**
 * @param {number[]} numbers
 * @param {number} target
 * @return {number[]} two integers in an array, ie: [index1, index2]
 */
var twoSum = function(numbers, target) {
    var table = {};
    var temp;
    var ans = [0, 0];

    for (var i = 0; i < numbers.length; ++i) {
        temp = (target - numbers[i]).toString();

        if (temp in table) {
            ans[0] = 1 + table[temp];
            ans[1] = 1 + i;
            break;
        } else {
            table[numbers[i].toString()] = i;
        }
    }

    return ans;
};
~~~


# Ruby
~~~ ruby
# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]} two integers in an array, ie: [index1, index2]
def two_sum(numbers, target)
    table = {}
    ans = [0, 0]

    numbers.each_with_index do | n, i |
        if table[target - n].nil?
            table[n] = i
        else
            ans = [1 + table[target - n], 1 + i]
            break
        end
    end

    ans
end
~~~
