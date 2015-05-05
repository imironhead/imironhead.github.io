---
layout: post
title: "LeetCode 0200: Number of Islands"
description: ""
category:
tags: ["puzzle", "programming"]
---

[Number of Islands](https://leetcode.com/problems/number-of-islands/)


# cpp

~~~ cpp
class Solution {
public:
  int numIslands(vector<vector<char>>& grid) {
    int num = 0;
    queue<pair<vector<char>::size_type, vector<char>::size_type>> islands_queue;

    for (auto x = 0; x < grid.size(); ++x) {
      for (auto y = 0; y < grid[x].size(); ++y) {
        if (grid[x][y] != '1') {
          continue;
        }

        num += 1;

        islands_queue.push(make_pair(x, y));

        while (!islands_queue.empty()) {
          auto point = islands_queue.front();

          islands_queue.pop();

          if (grid[point.first][point.second] != '1') {
            continue;
          }

          grid[point.first][point.second] = '2';

          if (point.first > 0) {
            islands_queue.push(make_pair(point.first - 1, point.second));
          }
          if (point.first + 1 < grid.size()) {
            islands_queue.push(make_pair(point.first + 1, point.second));
          }
          if (point.second > 0) {
            islands_queue.push(make_pair(point.first, point.second - 1));
          }
          if (point.second + 1 < grid[x].size()) {
            islands_queue.push(make_pair(point.first, point.second + 1));
          }
        }
      }
    }

    return num;
  }
};
~~~

# javascript

~~~ javascript
/**
 * @param {character[][]} grid
 * @return {number}
 */
function visit(grid, x, y) {
  if (x < 0 || y < 0 || x >= grid.length || y >= grid[0].length) {
    return;
  }

  if (grid[x][y] != '1') {
    return;
  }

  grid[x][y] = 'v';

  visit(grid, x + 1, y);
  visit(grid, x - 1, y);
  visit(grid, x, y + 1);
  visit(grid, x, y - 1);
}

var numIslands = function(grid) {
  var num = 0;

  for (var x = 0; x < grid.length; ++x) {
    for (y = 0; y < grid[x].length; ++y) {
      if (grid[x][y] != '1') {
        continue;
      }

      num += 1;

      visit(grid, x, y);
    }
  }

  return num;
};
~~~

# python

~~~ python
class Solution:
    def visit(self, grid, x, y) :
        if x < 0 or y < 0 or x >= len(grid) or y >= len(grid[x]) :
            return
        if grid[x][y] != '1' :
            return
        grid[x][y] = 'v'

        self.visit(grid, x - 1, y)
        self.visit(grid, x + 1, y)
        self.visit(grid, x, y - 1)
        self.visit(grid, x, y + 1)

    # @param {character[][]} grid
    # @return {integer}
    def numIslands(self, grid) :
        num = 0

        for x in xrange(len(grid)) :
            for y in xrange(len(grid[x])) :
                if grid[x][y] == '1' :
                    num += 1
                    self.visit(grid, x, y)

        return num
~~~

# ruby

~~~ ruby
# @param {Character[][]} grid
# @return {Integer}
def visit(grid, x, y)
  return if x < 0 or y < 0 or x >= grid.length or y >= grid[x].length
  return if grid[x][y] != '1'

  grid[x][y] = 'v'

  visit(grid, x - 1, y)
  visit(grid, x + 1, y)
  visit(grid, x, y - 1)
  visit(grid, x, y + 1)
end

def num_islands(grid)
  num = 0

  (0...grid.length).each do | x |
    (0...grid[x].length).each do | y |
      if grid[x][y] == '1'
        num += 1
        visit(grid, x, y)
      end
    end
  end

  num
end
~~~
