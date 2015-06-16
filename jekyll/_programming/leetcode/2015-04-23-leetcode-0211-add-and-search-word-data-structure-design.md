---
layout: post
title: "LeetCode 0211: Add and Search Word - Data structure design"
description: ""
category:
tags: ["puzzle", "programming"]
---


[Add and Search Word - Data structure design](https://leetcode.com/problems/add-and-search-word-data-structure-design/)


# cpp

~~~ cpp
class WordDictionary {

  struct Node {
    array<int, 26>  children;
    bool            is_word;

    Node() : is_word(false) {
      this->children.fill(0);
    }
  };

  struct Tree {
    vector<Node>    nodes;

    Tree() {
      this->nodes.emplace_back(Node());
    }

    void add_word(const string& word) {
      vector<Node>::size_type parent = 0;
      vector<Node>::size_type child;

      for (auto c : word) {
        Node& parent_node = this->nodes[parent];

        child = parent_node.children[c - 'a'];

        if (!child) {
          child = this->nodes.size();

          parent_node.children[c - 'a'] = child;
          this->nodes.emplace_back(Node());
        }

        parent = child;
      }

      this->nodes[parent].is_word = true;
    }

    bool search(const Node& root, const string& word) const {
      if (word.length()) {
        if (word[0] == '.') {
          for (auto i = 0; i < 26; ++i) {
            if (root.children[i] && this->search(this->nodes[root.children[i]], word.substr(1))) {
              return true;
            }
          }

          return false;
        } else {
          vector<Node>::size_type child = root.children[word.front() - 'a'];

          return child ? this->search(this->nodes[child], word.substr(1)) : false;
        }
      } else {
        return root.is_word;
      }
    }
  };

  Tree tree;

public:

  // Adds a word into the data structure.
  void addWord(string word) {
    this->tree.add_word(word);
  }

  // Returns if the word is in the data structure. A word could
  // contain the dot character '.' to represent any one letter.
  bool search(string word) {
    return this->tree.search(this->tree.nodes[0], word);
  }
};

// Your WordDictionary object will be instantiated and called as such:
// WordDictionary wordDictionary;
// wordDictionary.addWord("word");
// wordDictionary.search("pattern");
~~~
