---
layout: post
title: "LeetCode 0208: Implement Trie (Prefix Tree)"
description: ""
category:
tags: ["puzzle", "programming"]
---

[Implement Trie (Prefix Tree)](https://leetcode.com/problems/implement-trie-prefix-tree/)

# cpp

Use vector because I am too lazy to implement the destructor.

~~~ cpp
struct TrieNode {
  bool    fWord;
  int     rChild[26];

  TrieNode() : fWord(false) {
    fill(this->rChild, this->rChild + 26, 0);
  }
};

class Trie {
public:
  Trie() {
    this->rNode.push_back(TrieNode());
  }

  // Inserts a word into the trie.
  void insert(string s) {
    vector<TrieNode>::size_type iParent = 0;
    vector<TrieNode>::size_type iChild;

    for (auto c : s) {
      iChild = this->rNode[iParent].rChild[c - 'a'];

      if (!iChild) {
        iChild = this->rNode.size();

        this->rNode[iParent].rChild[c - 'a'] = iChild;
        this->rNode.push_back(TrieNode());
      }

      iParent = iChild;
    }

    this->rNode[iParent].fWord = true;
  }

  // Returns if the word is in the trie.
  bool search(string key) {
    vector<TrieNode>::size_type iParent = 0;
    vector<TrieNode>::size_type iChild;

    for (auto c : key) {
      iChild = this->rNode[iParent].rChild[c - 'a'];

      if (!iChild) {
        return false;
      }

      iParent = iChild;
    }

    return this->rNode[iParent].fWord;
  }

  // Returns if there is any word in the trie
  // that starts with the given prefix.
  bool startsWith(string prefix) {
    vector<TrieNode>::size_type iParent = 0;
    vector<TrieNode>::size_type iChild;

    for (auto c : prefix) {
      iChild = this->rNode[iParent].rChild[c - 'a'];

      if (!iChild) {
        return false;
      }

      iParent = iChild;
    }

    return true;
  }

private:
  vector<TrieNode> rNode;
};

// Your Trie object will be instantiated and called as such:
// Trie trie;
// trie.insert("somestring");
// trie.search("key");
~~~

# javascript

~~~ javascript
/**
 * @constructor
 * Initialize your data structure here.
 */
var TrieNode = function() {
  this.children = new Array(26);
  this.is_word = false;

  return this;
};

var Trie = function() {
  this.nodes = [new TrieNode()];
};

/**
 * @param {string} word
 * @return {void}
 * Inserts a word into the trie.
 */
Trie.prototype.insert = function(word) {
  var parent = 0;
  var code;

  for (var i = 0; i < word.length; ++i) {
    code = word.charCodeAt(i) - 97;

    if (this.nodes[parent].children[code] === undefined) {
      this.nodes[parent].children[code] = this.nodes.length;
      this.nodes.push(new TrieNode());

      parent = this.nodes.length - 1;
    } else {
      parent = this.nodes[parent].children[code];
    }
  }

  this.nodes[parent].is_word = true;
};

/**
 * @param {string} word
 * @return {boolean}
 * Returns if the word is in the trie.
 */
Trie.prototype.search = function(word) {
  var parent = 0;
  var code;

  for (var i = 0; i < word.length; ++i) {
    code = word.charCodeAt(i) - 97;

    if (this.nodes[parent].children[code] === undefined) {
      return false;
    } else {
      parent = this.nodes[parent].children[code];
    }
  }

  return this.nodes[parent].is_word;
};

/**
 * @param {string} prefix
 * @return {boolean}
 * Returns if there is any word in the trie
 * that starts with the given prefix.
 */
Trie.prototype.startsWith = function(prefix) {
  var parent = 0;
  var code;

  for (var i = 0; i < prefix.length; ++i) {
    code = prefix.charCodeAt(i) - 97;

    if (this.nodes[parent].children[code] === undefined) {
      return false;
    } else {
      parent = this.nodes[parent].children[code];
    }
  }

  return true;
};

/**
 * Your Trie object will be instantiated and called as such:
 * var trie = new Trie();
 * trie.insert("somestring");
 * trie.search("key");
 */
~~~

# python

~~~ python
class TrieNode:
    # Initialize your data structure here.
    def __init__(self) :
        self.children = [None for _ in xrange(26)]
        self.is_word = False

class Trie:

    def __init__(self):
        self.nodes = [TrieNode()]

    # @param {string} word
    # @return {void}
    # Inserts a word into the trie.
    def insert(self, word):
        parent = 0;

        for c in word :
            code = ord(c) - 97

            if self.nodes[parent].children[code] :
                parent = self.nodes[parent].children[code]
            else :
                self.nodes[parent].children[code] = len(self.nodes)
                self.nodes.append(TrieNode())

                parent = len(self.nodes) - 1

        self.nodes[parent].is_word = True

    # @param {string} word
    # @return {boolean}
    # Returns if the word is in the trie.
    def search(self, word):
        parent = 0

        for c in word :
            code = ord(c) - 97

            if self.nodes[parent].children[code] :
                parent = self.nodes[parent].children[code]
            else :
                return False

        return self.nodes[parent].is_word

    # @param {string} prefix
    # @return {boolean}
    # Returns if there is any word in the trie
    # that starts with the given prefix.
    def startsWith(self, prefix):
        parent = 0

        for c in prefix :
            code = ord(c) - 97

            if self.nodes[parent].children[code] :
                parent = self.nodes[parent].children[code]
            else :
                return False

        return True

# Your Trie object will be instantiated and called as such:
# trie = Trie()
# trie.insert("somestring")
# trie.search("key")
~~~

# ruby

~~~ ruby
class TrieNode
  attr_accessor :is_word
  attr_reader :children
  
  # Initialize your data structure here.
  def initialize
    @children = Array.new(26)
    @is_word = false
  end
end

class Trie
  def initialize
    @nodes = [TrieNode.new]
  end

  # @param {string} word
  # @return {void}
  # Inserts a word into the trie.
  def insert(word)
    parent = 0

    word.each_char do | c |
      if @nodes[parent].children[c.ord - 97]
        parent = @nodes[parent].children[c.ord - 97]
      else
        @nodes[parent].children[c.ord - 97] = @nodes.length
        @nodes << TrieNode.new

        parent = @nodes.length - 1
      end
    end

    @nodes[parent].is_word = true
  end

  # @param {string} word
  # @return {boolean}
  # Returns if the word is in the trie.
  def search(word)
    parent = 0

    word.each_char do | c |
      if @nodes[parent].children[c.ord - 97]
        parent = @nodes[parent].children[c.ord - 97]
      else
        return false
      end
    end

    @nodes[parent].is_word
  end

  # @param {string} prefix
  # @return {boolean}
  # Returns if there is any word in the trie
  # that starts with the given prefix.
  def starts_with(prefix)
    parent = 0

    prefix.each_char do | c |
      if @nodes[parent].children[c.ord - 97]
        parent = @nodes[parent].children[c.ord - 97]
      else
        return false
      end
    end

    true
  end
end

# Your Trie object will be instantiated and called as such:
# trie = Trie.new
# trie.insert("somestring")
# trie.search("key")
~~~
