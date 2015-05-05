---
layout: post
title: "LeetCode 0190: Intersection of Two Linked List"
description: ""
category:
tags: ["puzzle", "programming"]
---

[Intersection of Two Linked Lists](https://leetcode.com/problems/intersection-of-two-linked-lists/)


# cpp

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
    int length(ListNode* head) {
        int l = 0;

        while (head) {
            head = head->next;
            l += 1;
        }

        return l;
    }

    ListNode* advance(ListNode* head, int step) {
        while (step) {
            step -= 1;
            head = head->next;
        }

        return head;
    }

    ListNode *getIntersectionNode(ListNode* headA, ListNode* headB) {
        int length_a = length(headA);
        int length_b = length(headB);

        if (length_a > length_b) {
            headA = advance(headA, length_a - length_b);
        } else {
            headB = advance(headB, length_b - length_a);
        }

        while (headA) {
            if (headA == headB) {
                return headA;
            }

            headA = headA->next;
            headB = headB->next;
        }

        return nullptr;
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
 * @param {ListNode} headA
 * @param {ListNode} headB
 * @return {ListNode}
 */
function length(head) {
    var l = 0;

    while (head) {
        head = head.next;
        l += 1;
    }

    return l;
}

function forward(head, step) {
    while (step > 0) {
        head = head.next;
        step -= 1;
    }

    return head;
}

var getIntersectionNode = function(headA, headB) {
    var length_a = length(headA);
    var length_b = length(headB);

    if (length_a > length_b) {
        headA = forward(headA, length_a - length_b);
    } else {
        headB = forward(headB, length_b - length_a);
    }

    while (headA) {
        if (headA == headB) {
            return headA;
        }

        headA = headA.next;
        headB = headB.next;
    }

    return null;
};
~~~

# python

~~~ python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def length(self, head) :
        l = 0

        while head != None :
            head = head.next
            l += 1

        return l

    def advance(self, head, step) :
        while step > 0 :
            head = head.next
            step -= 1
        return head

    # @param two ListNodes
    # @return the intersected ListNode
    def getIntersectionNode(self, headA, headB):
        length_a = self.length(headA)
        length_b = self.length(headB)

        if length_a > length_b :
            headA = self.advance(headA, length_a - length_b)
        else :
            headB = self.advance(headB, length_b - length_a)

        while headA != None :
            if headA == headB :
                return headA

            headA = headA.next
            headB = headB.next

        return None
~~~
