---
layout: post
title: "LeetCode: Sort List"
description: ""
category:
tags: ["puzzle", "programming"]
---

Sort a linked list in O(n log n) time using constant space complexity.
- Merge sort is O(n log n).
- Length counting of list is O(n)
- Total complexity is O((n log n) + n) => O(n log n)

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
  ListNode* mergesort(ListNode* node, int len) {
    if (len < 2) {
      // end, nothing to sort
      return node;
    } else if (len == 2) {
      // sort two nodes
      if (node->val > node->next->val) {
        node->next->next = node;

        node = node->next;

        node->next->next = nullptr;
      }

      return node;
    }

    int nlen = (len >> 1);
    int mlen = nlen - 1;

    ListNode* l1 = node;
    ListNode* l2 = node;
    ListNode* temp;

    while (mlen) {
      l2 = l2->next;

      mlen -= 1;
    }

    temp = l2;
    l2 = l2->next;
    temp->next = nullptr;

    // divide the list into l1 and l2, sort them
    l1 = this->mergesort(l1, nlen);
    l2 = this->mergesort(l2, len - nlen);

    // merge two sorted list
    ListNode* head(nullptr);
    ListNode* tail(nullptr);

    while (l1 && l2) {
      if (l1->val < l2->val) {
        temp = l1;

        l1 = l1->next;
      } else {
        temp = l2;

        l2 = l2->next;
      }

      if (tail) {
        tail->next = temp;

        tail = temp;
      } else {
        head = temp;
        tail = temp;
      }

      temp->next = nullptr;
    }

    // append remained nodes, they are larger than merged nodes
    if (l1) {
      if (tail) {
        tail->next = l1;
      } else {
        head = l1;
      }
    } else if (l2) {
      if (tail) {
        tail->next = l2;
      } else {
        head = l2;
      }
    }

    return head;
  }

  ListNode *sortList(ListNode *head) {
    int len = 0;

    ListNode* temp = head;

    while (temp) {
      temp = temp->next;

      len += 1;
    }

    return this->mergesort(head, len);
  }
};
~~~
