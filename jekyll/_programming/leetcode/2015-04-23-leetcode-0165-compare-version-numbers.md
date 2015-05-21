---
layout: post
title: "LeetCode 0165: Compare Version Numbers"
description: ""
category:
tags: ["puzzle", "programming"]
---

[Compare Version Numbers](https://leetcode.com/problems/compare-version-numbers/)

# cpp

~~~ cpp
class Solution {
public:
  int cmp(int a, int b) const {
    return a > b ? 1 : (a < b ? -1 : 0);
  }

  int split(const string& version, string::size_type& start) const {
    if (start == version.size()) {
      return 0;
    }

    int v(0);

    for (; start < version.size(); ++start) {
      if (version[start] == '.') {
        start += 1;
        break;
      } else {
        v = v * 10 + (version[start] - '0');
      }
    }

    return v;
  }

  int compareVersion(
    string& version1, string::size_type& pos1,
    string& version2, string::size_type& pos2) const {

    int v1 = this->split(version1, pos1);
    int v2 = this->split(version2, pos2);

    if (pos1 == version1.size() && pos2 == version2.size()) {
      return this->cmp(v1, v2);
    }

    if (v1 == v2) {
      return this->compareVersion(version1, pos1, version2, pos2);
    } else {
      return this->cmp(v1, v2);
    }
  }

  int compareVersion(string version1, string version2) {
    string::size_type pos1(0);
    string::size_type pos2(0);

    return this->compareVersion(version1, pos1, version2, pos2);
  }
};
~~~

# javascript

~~~ javascript
var cmp = function(a, b) {
  if (a > b) {
    return 1;
  } else if (a < b) {
    return -1;
  } else {
    return 0;
  }
};

var split = function(version) {
  if (!version) {
    return [0, null];
  }

  var i = version.indexOf('.');

  if (i < 0) {
    return [parseInt(version), null];
  } else {
    return [parseInt(version.substr(0, i)), version.substr(i + 1)];
  }
};

/**
 * @param {string} version1
 * @param {string} version2
 * @return {number}
 */
var compareVersion = function(version1, version2) {
  var v1 = split(version1);
  var v2 = split(version2);

  if (!v1[1] && !v2[1]) {
    return cmp(v1[0], v2[0]);
  }

  if (v1[0] == v2[0]) {
    return compareVersion(v1[1], v2[1]);
  } else {
    return cmp(v1[0], v2[0]);
  }
};
~~~

# python

~~~ python
class Solution:
  def compare(self, a, b) :
    if a > b :
      return 1
    elif a < b :
      return -1
    else :
      return 0

  def split(self, version) :
    if not version :
      return (0, None)

    vs = version.split('.', 1)

    if len(vs) == 2 :
      return (int(vs[0]), vs[1])
    else :
      return (int(vs[0]), None)

  # @param {string} version1
  # @param {string} version2
  # @return {integer}
  def compareVersion(self, version1, version2) :
    v1, vs_1 = self.split(version1)
    v2, vs_2 = self.split(version2)

    if vs_1 is None and vs_2 is None :
      return self.compare(v1, v2)

    if v1 == v2 :
      return self.compareVersion(vs_1, vs_2)
    else :
      return self.compare(v1, v2)
~~~

# ruby

~~~ ruby
def split(version)
  return 0, nil if version.nil? or version.length.zero?

  vs = version.split('.', 2)

  return vs[0].to_i, vs[1]
end

# @param {String} version1
# @param {String} version2
# @return {Integer}
def compare_version(version1, version2)
  m1, s1 = split(version1)
  m2, s2 = split(version2)

  return m1 <=> m2 if s1.nil? and s2.nil?
  return compare_version(s1, s2) if m1 == m2
  return m1 <=> m2
end
~~~
