---
layout: post
title: "LeetCode 0206: Reverse Linked List"
description: ""
category:
tags: ["puzzle", "programming"]
---

[Reverse Linked List](https://leetcode.com/problems/reverse-linked-list/)

# cpp iteratively

~~~ cpp
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
  ListNode* reverseList(ListNode* head) {
    if (!head) {
      return nullptr;
    }

    ListNode* next = nullptr;
    ListNode* temp;

    while (head) {
      temp = head->next;
      head->next = next;
      next = head;
      head = temp;
    }

    return next;
  }
};
~~~

# cpp recursively

~~~ cpp
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
  ListNode* helper(ListNode* headOld, ListNode* headNew) {
    // alert(headOld);

    ListNode* temp = headOld;

    headOld = headOld->next;

    temp->next = headNew;

    if (headOld) {
      return this->helper(headOld, temp);
    } else {
      return temp;
    }
  }

  ListNode* reverseList(ListNode* head) {
    if (!head) {
      return nullptr;
    }

    return this->helper(head, nullptr);
  }
};
~~~

# javascript

~~~ javascript
/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var reverseList = function(head) {
  if (!head) {
    return null;
  }

  var next = null;
  var temp;

  while (head) {
    temp = head;
    head = head.next;
    temp.next = next;
    next = temp;
  }

  return next;
};
~~~

# python recursively

~~~ python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def recursively(self, headOld, headNew) :
        temp = headOld
        headOld = headOld.next
        temp.next = headNew

        if headOld :
            return self.recursively(headOld, temp)
        else :
            return temp

    # @param {ListNode} head
    # @return {ListNode}
    def reverseList(self, head) :
        if head :
            return self.recursively(head, None)
        else :
            return None
~~~

# ruby

~~~ ruby
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  return nil if head.nil?

  _new = nil

  until head.nil?
    temp, head = head, head.next
    _new, temp.next = temp, _new
  end

  _new
end
~~~
