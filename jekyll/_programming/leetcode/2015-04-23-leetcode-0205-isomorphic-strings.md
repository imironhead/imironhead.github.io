---
layout: post
title: "LeetCode 0205: Isomorphic Strings"
description: ""
category:
tags: ["puzzle", "programming"]
---

[Isomorphic Strings](https://leetcode.com/problems/isomorphic-strings/)

# cpp

~~~ cpp
class Solution {
public:
    bool isIsomorphic(string s, string t) {
        char table_s_t[256] = {0};
        char table_t_s[256] = {0};

        for (auto i = 0; i < s.length(); ++i) {
            if ((table_s_t[s[i]] == 0) && (table_t_s[t[i]] == 0)) {
                table_s_t[s[i]] = t[i];
                table_t_s[t[i]] = s[i];
            } else if ((table_s_t[s[i]] != t[i]) || (table_t_s[t[i]] != s[i])) {
                return false;
            }
        }

        return true;
    }
};
~~~

# python

~~~ python
class Solution:
    # @param {string} s
    # @param {string} t
    # @return {boolean}
    def isIsomorphic(self, s, t):
        table_s_t = {}
        table_t_s = {}

        for i in xrange(len(s)) :
            if s[i] not in table_s_t and t[i] not in table_t_s :
                table_s_t[s[i]] = t[i]
                table_t_s[t[i]] = s[i]
            elif table_s_t.get(s[i], 0) != t[i] or table_t_s.get(t[i], 0) != s[i] :
                return False

        return True
~~~

# javascript

~~~ javascript
/**
 * @param {string} s
 * @param {string} t
 * @return {boolean}
 */
var isIsomorphic = function(s, t) {
    var table_s_t = {};
    var table_t_s = {};

    for (var i = 0; i < s.length; ++i) {
        if (!(s[i] in table_s_t) && !(t[i] in table_t_s)) {
            table_s_t[s[i]] = t[i];
            table_t_s[t[i]] = s[i];
        } else if ((table_s_t[s[i]] != t[i]) || (table_t_s[t[i]] != s[i])) {
            return false;
        }
    }

    return true;
};
~~~

# ruby

~~~ ruby
# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
    table_s_t = Array.new(256, 0)
    table_t_s = Array.new(256, 0)

    (0...t.length).each do | i |
        if (table_s_t[s[i].ord] == 0) and (table_t_s[t[i].ord] == 0)
            table_s_t[s[i].ord] = t[i]
            table_t_s[t[i].ord] = s[i]
        elsif table_s_t[s[i].ord] != t[i] or table_t_s[t[i].ord] != s[i]
            return false
        end
    end

    true
end
~~~
