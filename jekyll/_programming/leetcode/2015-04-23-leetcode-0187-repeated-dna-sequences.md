---
layout: post
title: "LeetCode 0187: Repeated DNA Sequences"
description: ""
category:
tags: ["puzzle", "programming"]
---

[Repeated DNA Sequences](https://leetcode.com/problems/repeated-dna-sequences/)

# cpp

~~~ cpp
class Solution {
  unsigned int next_hash(unsigned int h, char c) const {
    h = (h << 2) & 1048575;

    switch (c) {
      case 'A' : h |= 0; break;
      case 'C' : h |= 1; break;
      case 'G' : h |= 2; break;
      case 'T' : h |= 3; break;
    }

    return h;
  }

  unsigned int hash(const string& s, string::size_type begin) const {
    auto end = begin + 10;
    unsigned int code = 0;

    while (begin < end) {
      code = this->next_hash(code, s[begin]);

      begin += 1;
    }

    return code;
  }

public:
  vector<string> findRepeatedDnaSequences(string s) {
    if (s.length() < 11) {
      return {};
    }

    char table[1048576] = {0};
    vector<string> result;

    unsigned int code = this->hash(s, 0);

    table[code] = 1;

    for (auto i = 1; i + 10 <= s.length(); ++i) {
      code = this->next_hash(code, s[i + 9]);

      table[code] += 1;

      if (table[code] == 2) {
        result.push_back(s.substr(i, 10));
      }
    }

    return result;
  }
};
~~~

# javascript

~~~ javascript
var next_hash = function(code, char) {
  code = code << 2;

  if (char == 'A') { code += 1; }
  else if (char == 'C') { code += 2; }
  else if (char == 'G') { code += 3; }

  return code & 1048575;
}

/**
* @param {string} s
* @return {string[]}
*/
var findRepeatedDnaSequences = function(s) {
  if (s.length < 11) {
    return [];
  }

  var result = [];
  var table_1 = new Uint8Array(131072);
  var table_2 = new Uint8Array(131072);

  var code = 0;
  var a, b;

  for (var i = 0; i < 10; ++i) {
    code = next_hash(code, s[i]);
  }

  table_1[code >> 3] = 1 << (code & 7);

  for (var j = 1; j + 10 <= s.length; ++j) {
    code = next_hash(code, s[j + 9]);

    a = code >> 3;
    b = 1 << (code & 7);

    if ((table_1[a] & b) === 0) {
      table_1[a] |= b;
    } else if ((table_2[a] & b) === 0) {
      table_2[a] |= b;
      result.push(s.substring(j, j + 10));
    }
  }

  return result;
};
~~~

# python

~~~ python
class Solution:
  def next_hash(self, code, char) :
    code <<= 2

    if char == 'A' :
      code += 1
    elif char == 'C' :
      code += 2
    elif char == 'G' :
      code += 3

    return code & 1048575;

  # @param {string} s
  # @return {string[]}
  def findRepeatedDnaSequences(self, s) :
    if len(s) < 11 :
      return []

    # 32768 * 32 = 1048576 = 2 ^ 20
    table_1 = [0 for _ in xrange(32768)]
    table_2 = [0 for _ in xrange(32768)]

    code = 0

    for i in xrange(10) :
      code = self.next_hash(code, s[i])

    a, b = code >> 5, 1 << (code & 31)

    table_1[a] = b

    result = []

    for i in xrange(1, len(s) - 9) :
      code = self.next_hash(code, s[i + 9])

      a, b = code >> 5, 1 << (code & 31)

      if table_1[a] & b == 0 :
        table_1[a] |= b
      elif table_2[a] & b == 0 :
        table_2[a] |= b

        result.append(s[i:i+10])

    return result
~~~

# ruby

~~~ ruby
def next_hash(code, char)
  code = code << 2

  if char == 'A'
    (code + 1) & 1048575
  elsif char == 'C'
    (code + 2) & 1048575
  elsif char == 'G'
    (code + 3) & 1048575
  else
    code & 1048575
  end
end

# @param {String} s
# @return {String[]}
def find_repeated_dna_sequences(s)
  return [] if s.length < 11

  code = 0

  0.upto(9).each { | i | code = next_hash(code, s[i]) }

  a, b = code >> 5, 1 << (code & 31)

  table_1, table_2 = Array.new(32768, 0), Array.new(32768, 0)

  table_1[a] = b

  result = []

  (10...s.length).each do | i |
    code = next_hash(code, s[i])

    a, b = code >> 5, 1 << (code & 31)

    if (table_1[a] & b).zero?
      table_1[a] |= b
    elsif (table_2[a] & b).zero?
      table_2[a] |= b

      result << s[i-9..i]
    end
  end

  result
end
~~~
