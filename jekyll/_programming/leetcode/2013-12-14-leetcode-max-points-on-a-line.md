---
layout: post
title: "LeetCode: Max Points on a Line"
description: ""
category:
tags: ["puzzle", "programming"]
---

:)

~~~ cpp
/**
 * Definition for a point.
 * struct Point {
 *     int x;
 *     int y;
 *     Point() : x(0), y(0) {}
 *     Point(int a, int b) : x(a), y(b) {}
 * };
 */

#include <cstdlib>
#include <string>
#include <vector>
#include <unordered_set>

using namespace std;

//------------------------------------------------------------------------------
int gcd(int a, int b) {
  int c;

  while (true) {
    if (a == b) {
      return a;
    }

    if (a > b) {
      c = a % b;

      if (c == 0) {
        return b;
      }

      a = c;
    } else {
      c = b % a;

      if (c == 0) {
        return a;
      }

      b = c;
    }
  }
}

//------------------------------------------------------------------------------
struct Line {
  //--ax + by = c
  int    a;
  int    b;
  int    c;
  bool  s;

  Line() {
  }

  Line(const Point& p1, const Point& p2) {
    this->Set(p1, p2);
  }

  void Set(const Point& p1, const Point& p2) {
    if (p1.x == p2.x) {
      if (p1.y == p2.y) {
        this->s = true;

        this->a = p1.x;
        this->b = p1.y;
      } else {
        this->s = false;

        this->a = 1;
        this->b = 0;
        this->c = p1.x;
      }
    } else if (p1.y == p2.y) {
      this->s = false;

      this->a = 0;
      this->b = 1;
      this->c = p1.y;
    } else {
      this->s = false;

      this->a = p1.y - p2.y;
      this->b = p2.x - p1.x;

      int g = gcd(abs(this->a), abs(this->b));

      if (this->a < 0) {
        g = -g;
      }

      this->a /= g;
      this->b /= g;

      this->c = this->a * p1.x + this->b * p1.y;
    }
  }

  string Key() {
    string key = this->s ? "*+" : to_string(this->c) + "+";

    key += to_string(this->a);

    if (this->b >= 0) {
      key += "+" + to_string(this->b);
    } else {
      key += to_string(this->b);
    }

    return key;
  }

  bool Intersect(const Point& pt) const {
    if (this->s) {
      return (this->a == pt.x) && (this->b == pt.y);
    } else {
      return this->a * pt.x + this->b * pt.y == this->c;
    }
  }
};

class Solution {
public:
  int maxPoints(vector<Point> &points) {
    unordered_set<string> lines;

    int m(0);
    int n;

    vector<Point>::size_type i;
    vector<Point>::size_type j;
    vector<Point>::size_type k;

    Line line;

    string key;

    for (i = 0; i < points.size(); ++i) {
      for (j = i; j < points.size(); ++j) {
        line.Set(points[i], points[j]);

        key = line.Key();

        if (lines.find(key) == lines.end()) {
          lines.insert(key);

          n = 0;

          for (k = 0; k < points.size(); ++k) {
            if (line.Intersect(points[k])) {
              n += 1;
            }
          }

          if (m < n) {
            m = n;
          }
        }
      }
    }

    return m;
  }
};
~~~
