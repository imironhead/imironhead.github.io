---
layout: post
title: "LeetCode 0002: Add Two Numbers"
description: ""
category:
tags: ["puzzle", "programming"]
---

[Add Two Numbers](https://leetcode.com/problems/add-two-numbers/)

A pencil-and-paper algorithm.

* Implement a push_back method would be better.
* I don't like this kind of method which alloc memories and method name provide no hints.

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
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        ListNode dummy(0);
        ListNode* pTail = &dummy;

        while (l1 && l2) {
            pTail->next = new ListNode(l1->val + l2->val);

            if (pTail->val >= 10) {
                pTail->val -= 10;
                pTail->next->val += 1;
            }

            pTail = pTail->next;

            l1 = l1->next;
            l2 = l2->next;
        }

        if (l1 == nullptr) {
            l1 = l2;
        }

        while (l1) {
            pTail->next = new ListNode(l1->val);

            if (pTail->val >= 10) {
                pTail->val -= 10;
                pTail->next->val += 1;
            }

            pTail = pTail->next;

            l1 = l1->next;
        }

        if (pTail->val >= 10) {
            pTail->val -= 10;
            pTail->next = new ListNode(1);
        }

        return dummy.next;
    }
};
~~~


# Python
~~~ python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    # @param {ListNode} l1
    # @param {ListNode} l2
    # @return {ListNode}
    def addTwoNumbers(self, l1, l2):
        dummy = ListNode(0)
        tail = dummy

        while l1 and l2 :
            tail.next = ListNode(l1.val + l2.val)

            if tail.val >= 10 :
                tail.val -= 10
                tail.next.val += 1

            tail = tail.next

            l1 = l1.next
            l2 = l2.next

        if l1 is None :
            l1 = l2

        while l1 :
            tail.next = ListNode(l1.val)

            if tail.val >= 10 :
                tail.val -= 10
                tail.next.val += 1

            tail = tail.next

            l1 = l1.next

        if tail.val >= 10 :
            tail.val -= 10
            tail.next = ListNode(1)

        return dummy.next
~~~


# Javascript
~~~ javascript
/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 */
var addTwoNumbers = function(l1, l2) {
    var head = new ListNode(0);
    var tail = head;

    while (l1 && l2) {
        tail.next = new ListNode(l1.val + l2.val);

        if (tail.val >= 10) {
            tail.val -= 10;
            tail.next.val += 1;
        }

        tail = tail.next;

        l1 = l1.next;
        l2 = l2.next;
    }

    if (!l1) {
        l1 = l2;
    }

    while (l1) {
        tail.next = new ListNode(l1.val);

        if (tail.val >= 10) {
            tail.val -= 10;
            tail.next.val += 1;
        }

        tail = tail.next;

        l1 = l1.next;
    }

    if (tail.val >= 10) {
        tail.val -= 10;
        tail.next = new ListNode(1);
    }

    return head.next;
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

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    ans_head = ListNode.new(0)
    ans_tail = ans_head

    until l1.nil? || l2.nil? do
        ans_tail.next = ListNode.new(l1.val + l2.val)

        if ans_tail.val >= 10
            ans_tail.val -= 10
            ans_tail.next.val += 1
        end

        ans_tail = ans_tail.next

        l1 = l1.next
        l2 = l2.next
    end

    l1 = l2 if l1.nil?

    until l1.nil? do
        ans_tail.next = ListNode.new(l1.val)

        if ans_tail.val >= 10
            ans_tail.val -= 10
            ans_tail.next.val += 1
        end

        ans_tail = ans_tail.next

        l1 = l1.next
    end

    if ans_tail.val >= 10
        ans_tail.val -= 10
        ans_tail.next = ListNode.new(1)
    end

    ans_head.next
end
~~~
