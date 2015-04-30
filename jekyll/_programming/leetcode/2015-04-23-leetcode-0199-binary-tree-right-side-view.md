---
layout: post
title: "LeetCode 0199: Binary Tree Right Side View"
description: ""
category:
tags: ["puzzle", "programming"]
---

[Binary Tree Right Side View](https://leetcode.com/problems/binary-tree-right-side-view/)

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
class Solution {
public:
    void tranverse(TreeNode* node, vector<int>& view, int depth) {
        if (node == nullptr) {
            return;
        }

        if (view.size() <= depth) {
            view.push_back(node->val);
        }

        tranverse(node->right, view, depth + 1);
        tranverse(node->left, view, depth + 1);
    }

    vector<int> rightSideView(TreeNode *root) {
        vector<int> view;

        tranverse(root, view, 0);

        return view;
    }
};
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
 * @param {TreeNode} root
 * @returns {number[]}
 */
function right_side_view(root, view, depth) {
    if (root === null) {
        return;
    }

    if (depth >= view.length) {
        view.push(root.val);
    }

    right_side_view(root.right, view, depth + 1);
    right_side_view(root.left, view, depth + 1);
}

var rightSideView = function(root) {
    var view = [];

    right_side_view(root, view, 0);

    return view;
};
~~~

# python

~~~ python
# Definition for a  binary tree node
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    # @param root, a tree node
    # @return a list of integers
    def right_side_view(self, view, node, depth) :
        if node is None :
            return

        if len(view) <= depth :
            view.append(node.val)

        self.right_side_view(view, node.right, depth + 1)
        self.right_side_view(view, node.left, depth + 1)

    def rightSideView(self, root):
        view = []

        self.right_side_view(view, root, 0)

        return view
~~~

# ruby

~~~ ruby
# Definition for a binary tree node
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[]}
def tranverse(root, view, depth)
    return view if root.nil?

    view << root.val if view.length <= depth

    tranverse(root.right, view, depth + 1)
    tranverse(root.left, view, depth + 1)
end

def right_side_view(root)
    tranverse(root, [], 0)
end
~~~
