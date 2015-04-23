---
layout: post
title: "LeetCode 0203: Remove Linked List Elements "
description: ""
category:
tags: ["puzzle", "programming"]
---


[Remove Linked List Elements](https://leetcode.com/problems/remove-linked-list-elements/)


# CPP

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
    ListNode* removeElements(ListNode* head, int val) {
        ListNode dummy(0);
        ListNode* pNext = &dummy;
        ListNode* pTemp;

        dummy.next = head;

        while (pNext->next) {
            if (pNext->next->val == val) {
                pTemp = pNext->next;
                pNext->next = pTemp->next;

                // delete? free? customized allocator?
                delete pTemp;
            } else {
                pNext = pNext->next;
            }
        }

        return dummy.next;
    }
};
~~~


# Python

~~~python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    # @param {ListNode} head
    # @param {integer} val
    # @return {ListNode}
    def removeElements(self, head, val):
        dummy = ListNode(0)
        dummy.next = head
        temp = dummy

        while temp.next :
            if temp.next.val == val :
                temp.next = temp.next.next
            else :
                temp = temp.next

        return dummy.next
~~~


# Javascript

~~~javascript
/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode} head
 * @param {number} val
 * @return {ListNode}
 */
var removeElements = function(head, val) {
    var dummy = new ListNode(0);
    var temp = dummy;

    dummy.next = head;

    while (temp.next) {
        if (temp.next.val == val) {
            temp.next = temp.next.next;
        } else {
            temp = temp.next;
        }
    }

    return dummy.next;
};
~~~


# Ruby
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
# @param {Integer} val
# @return {ListNode}
def remove_elements(head, val)
    dummy = ListNode.new(0)
    dummy.next = head

    temp = dummy

    while temp.next do
        if temp.next.val == val
            temp.next = temp.next.next
        else
            temp = temp.next
        end
    end

    dummy.next
end
~~~
