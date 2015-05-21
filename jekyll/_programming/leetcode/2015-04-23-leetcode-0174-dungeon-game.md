---
layout: post
title: "LeetCode 0174: Dungeon Game"
description: ""
category:
tags: ["puzzle", "programming"]
---

[Dungeon Game](https://leetcode.com/problems/dungeon-game/)

# cpp

~~~ cpp
class Solution {
public:
  int calculateMinimumHP(vector<vector<int>>& dungeon) {
    if (dungeon.empty() || dungeon.front().empty()) {
      return 0;
    }

    const int mx = dungeon.size() - 1;
    const int my = dungeon.front().size() - 1;
    int t;

    vector<int> dp(my + 2, numeric_limits<int>::max());

    for (auto x = mx; x >= 0; --x) {
      for (auto y = my; y >= 0; --y) {
        t = (x == mx && y == my) ? 1 : min(dp[y], dp[y + 1]);

        dp[y] = (dungeon[x][y] < t) ? (t - dungeon[x][y]) : 1;
      }
    }

    return dp[0];
  }
};
~~~

# javascript

~~~ javascript
/**
 * @param {number[][]} dungeon
 * @return {number}
 */
var calculateMinimumHP = function(dungeon) {
  if (dungeon.length === 0 || dungeon[0].length === 0) {
    return 0;
  }

  var mx = dungeon.length - 1;
  var my = dungeon[0].length - 1;
  var t;

  var dp = [];

  for (var i = my + 1; i >= 0; --i) {
    dp.push(9007199254740992);
  }

  for (var x = mx; x >= 0; --x) {
    for (var y = my; y >= 0; --y) {
      t = (x == mx && y == my) ? 1 : Math.min(dp[y], dp[y + 1]);

      dp[y] = (dungeon[x][y] < t) ? (t - dungeon[x][y]) : 1;
    }
  }

  return dp[0];  
};
~~~

# python

~~~ python
class Solution:
  # @param {integer[][]} dungeon
  # @return {integer}
  def calculateMinimumHP(self, dungeon):
    if len(dungeon) == 0 or len(dungeon[0]) == 0 :
      return 0;

    mx = len(dungeon) - 1;
    my = len(dungeon[0]) - 1;

    dp = [9223372036854775807 for _ in xrange(my + 2)]

    for x in xrange(mx, -1, -1) :
      for y in xrange(my, -1, -1) :
        t = 1 if (x == mx and y == my) else min(dp[y], dp[y + 1])

        dp[y] = (t - dungeon[x][y]) if (dungeon[x][y] < t) else 1

    return dp[0]
~~~

# ruby

~~~ ruby
# @param {Integer[][]} dungeon
# @return {Integer}
def calculate_minimum_hp(dungeon)
  return 0 if dungeon.empty? or dungeon[0].empty?

  mx, my = dungeon.length - 1, dungeon[0].length - 1

  dp = Array.new(my + 2, 9223372036854775807)

  mx.downto(0) do | x |
    my.downto(0) do | y |
      t = (x == mx and y == my) ? 1 : [dp[y], dp[y + 1]].min

      dp[y] = (dungeon[x][y] < t) ? (t - dungeon[x][y]) : 1
    end
  end

  dp[0]
end
~~~
