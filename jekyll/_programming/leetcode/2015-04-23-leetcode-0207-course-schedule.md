---
layout: post
title: "LeetCode 0207: Course Schedule"
description: ""
category:
tags: ["puzzle", "programming"]
---

[Course Schedule](https://leetcode.com/problems/course-schedule/)


# cpp

~~~ cpp
class Solution {
  struct Course {
    int         fVisited;
    vector<int> rPrerequisites;

    Course() : fVisited(0) {}
  };

public:
  bool canFinish(int numCourses, vector<vector<int>>& prerequisites) {
    // rebuild the graph
    vector<Course> courses(numCourses);

    for (auto& prerequisite : prerequisites) {
      courses[prerequisite[0]].rPrerequisites.push_back(prerequisite[1]);
    }

    // BFS
    queue<vector<Course>::size_type> qPrerequisites;

    int fVisited(0);

    for (auto iChecked = 0; iChecked < courses.size(); ++iChecked) {
      if (courses[iChecked].fVisited) {
        // this course was checked and can be finished
        continue;
      }

      // flag of current cycle (to mark separated graph)
      // course flag is 0 => course was not checked
      // course flag is flag => course was checked and can not be finished
      // course flag is not 0 or flag => course was checked and can be finished
      fVisited += 1;

      courses[iChecked].fVisited = fVisited;

      // start to check from iChecked'th course
      qPrerequisites.push(iChecked);

      // do BFS
      while (!qPrerequisites.empty()) {
        auto iTemp = qPrerequisites.front();

        qPrerequisites.pop();

        // the course was not checked, mark it as checked
        courses[iTemp].fVisited = fVisited;

        for (auto& p : courses[iTemp].rPrerequisites) {
          if (courses[p].fVisited) {
            if (courses[p].fVisited == fVisited) {
              // in cycle
              return false;
            }
            // p was visited and not in cycle => will not be in a cycle with iTemp
          } else {
            // p may be in a cycle, push to queue and check it later
            qPrerequisites.push(p);
          }
        }
      }
    }

    return true;
  }
};
~~~

# javascript

~~~ javascript
/**
 * @param {number} numCourses
 * @param {number[][]} prerequisites
 * @return {boolean}
 */
var canFinish = function(numCourses, prerequisites) {
  var courses = new Array(numCourses);

  for (var c = 0; c < numCourses; ++c) {
    courses[c] = {visit: 0, prerequisites: []};
  }

  for (var p = 0; p < prerequisites.length; ++p) {
    courses[prerequisites[p][0]].prerequisites.push(prerequisites[p][1]);
  }

  var queue = [];
  var flag = 0;

  for (var checked = 0; checked < numCourses; ++checked) {
    if (courses[checked].visit !== 0) {
      continue;
    }

    flag += 1;

    queue.push(checked);

    while (queue.length > 0) {
      var t = queue[queue.length - 1];

      queue.pop();

      courses[t].visit = flag;

      for (var q = 0; q < courses[t].prerequisites.length; ++q) {
        var k = courses[t].prerequisites[q];

        if (courses[k].visit > 0) {
          if (courses[k].visit === flag) {
            return false;
          }
        } else {
          queue.push(k);
        }
      }
    }
  }

  return true;
};
~~~

# python

~~~ python
class Solution:
  # @param {integer} numCourses
  # @param {integer[][]} prerequisites
  # @return {boolean}
  def canFinish(self, num_courses, prerequisites):
    courses = [[0, []] for _ in xrange(num_courses)]

    for prerequisite in prerequisites :
      courses[prerequisite[0]][1].append(prerequisite[1])

    queue = []
    flag = 0

    for c in xrange(num_courses) :
      if courses[c][0] > 0 :
        continue

      flag += 1

      queue.append(c)

      while len(queue) > 0 :
        t = queue[0]

        del queue[0]

        courses[t][0] = flag

        for p in courses[t][1] :
          if courses[p][0] > 0 :
            if courses[p][0] == flag :
              return False
          else :
            queue.append(p)

    return True
~~~

# ruby

~~~ ruby
# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish(num_courses, prerequisites)
  courses = (0...num_courses).map { |_| [-1, []] }

  prerequisites.each { |p| courses[p[0]][1] << p[1] }

  queue = Queue.new

  courses.each_with_index do | course, flag |
    next if course[0] >= 0

    queue << flag

    until queue.empty?
      t = queue.pop

      courses[t][0] = flag

      courses[t][1].each do | c |
        if courses[c][0] < 0
          queue << c
        elsif courses[c][0] == flag
          return false
        end
      end
    end
  end

  true
end
~~~
