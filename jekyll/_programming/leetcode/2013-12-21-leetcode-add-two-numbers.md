---
layout: post
title: "LeetCode: Add Two Numbers"
description: ""
category:
tags: ["puzzle", "programming"]
---

A pencil-and-paper algorithm.

* Implement a push_back methos would be better.
* I don't like this kind of method which alloc memories and method name provide no hints.

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
    ListNode* head = nullptr;
    ListNode* tail = nullptr;

    bool ten = false;

    while (l1 && l2) {
      if (tail) {
        tail->next = new ListNode(l1->val + l2->val);

        tail = tail->next;
      } else {
        head = new ListNode(l1->val + l2->val);

        tail = head;
      }

      // position
      if (ten) {
        tail->val += 1;
      }

      if (tail->val >= 10) {
        tail->val -= 10;

        ten = true;
      } else {
        ten = false;
      }

      l1 = l1->next;
      l2 = l2->next;
    }

    l1 = l1 ? l1 : l2;

    while (l1) {
      if (tail) {
        tail->next = new ListNode(l1->val);

        tail = tail->next;
      } else {
        head = new ListNode(l1->val);

        tail = head;
      }

      if (ten) {
        tail->val += 1;
      }

      if (tail->val >= 10) {
        tail->val -= 10;

        ten = true;
      } else {
        ten = false;
      }

      l1 = l1->next;
    }

    if (ten) {
      tail->next = new ListNode(1);
    }

    return head;
  }
};
~~~
