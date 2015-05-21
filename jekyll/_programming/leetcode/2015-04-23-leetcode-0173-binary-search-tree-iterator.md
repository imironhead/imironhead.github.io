---
layout: post
title: "LeetCode 0173: Binary Search Tree Iterator"
description: ""
category:
tags: ["puzzle", "programming"]
---

[Binary Search Tree Iterator](https://leetcode.com/problems/binary-search-tree-iterator/)

# cpp

~~~ cpp
/**
 * Definition for binary tree
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
 class BSTIterator {
   stack<TreeNode*> nodes_stack;

 public:
   BSTIterator(TreeNode *root) {
     while (root) {
       this->nodes_stack.push(root);

       root = root->left;
     }
   }

   /** @return whether we have a next smallest number */
   bool hasNext() {
     return !this->nodes_stack.empty();
   }

   /** @return the next smallest number */
   int next() {
     TreeNode* top = this->nodes_stack.top();
     TreeNode* temp = top->right;

     this->nodes_stack.pop();

     while (temp) {
       this->nodes_stack.push(temp);

       temp = temp->left;
     }

     return top->val;
   }
 };

 /**
 * Your BSTIterator will be called like this:
 * BSTIterator i = BSTIterator(root);
 * while (i.hasNext()) cout << i.next();
 */
~~~

# javascript

~~~ javascript
/**
 * Definition for binary tree
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */

/**
 * @constructor
 * @param {TreeNode} root - root of the binary search tree
 */
 var BSTIterator = function(root) {
   this.stack = [];

   while (root) {
     this.stack.push(root);
     root = root.left;
   }
 };


 /**
 * @this BSTIterator
 * @returns {boolean} - whether we have a next smallest number
 */
 BSTIterator.prototype.hasNext = function() {
   return 0 < this.stack.length;
 };

 /**
 * @this BSTIterator
 * @returns {number} - the next smallest number
 */
 BSTIterator.prototype.next = function() {
   var s = this.stack[this.stack.length - 1];

   this.stack.pop();

   var t = s.right;

   while (t) {
     this.stack.push(t);

     t = t.left;
   }

   return s.val;
 };

 /**
 * Your BSTIterator will be called like this:
 * var i = new BSTIterator(root), a = [];
 * while (i.hasNext()) a.push(i.next());
 */
~~~

# python

~~~ python
# Definition for a  binary tree node
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class BSTIterator:
  # @param root, a binary search tree's root node
  def __init__(self, root):
    self._stack = []

    while root :
      self._stack.append(root)

      root = root.left;

  # @return a boolean, whether we have a next smallest number
  def hasNext(self):
    return len(self._stack) > 0


  # @return an integer, the next smallest number
  def next(self):
    t = self._stack[-1]
    s = t.right;

    del self._stack[-1]

    while s :
      self._stack.append(s)

      s = s.left

    return t.val

# Your BSTIterator will be called like this:
# i, v = BSTIterator(root), []
# while i.hasNext(): v.append(i.next())
~~~
