---
layout: post
title: "LeetCode 0189: Rotate Array "
description: ""
category:
tags: ["puzzle", "programming"]
---

[Rotate Array](https://leetcode.com/problems/rotate-array/)

# Thinking

* If length is 0, then it's done.
* If k % length is 0, it's also done.
* Use the last k elements as in-place buffer.

## If length % k is 0

~~~ console
e.g. l = 12, k = 4

1,2,3,4, 5,6,7,8, a,b,c,d

swap first k elements with the last k ones.

1 <-> a
2 <-> b
3 <-> c
4 <-> d

a,b,c,d, 5,6,7,8, 1,2,3,4

Then the first k elements are done.
The k ~ k+k-1 elements are in the in-place buffer.

So swap nums[k:k+k] with the buffer and nums[k:k+k] are done.

a,b,c,d, 1,2,3,4, 5,6,7,8

Then all elements are done!!!

=> Keep swapping to get the final answer!!!
~~~

## If length % k is not 0

~~~ console
e.g. l = 14, k = 3

1,2,3, 4,5,6, 7,8,a, b,c, d,e,f

Keep swapping until b,c remaining (count of remain is length % k)

=> Every element before b,c are done!!!

Keep swapping give:

d,e,f, 1,2,3, 4,5,6, b,c, 7,8,a
d,e,f, 1,2,3, 4,5,6, 7,8, b,c,a
d,e,f, 1,2,3, 4,5,6, 7,8,a, c,b

If k % (length % k) is 0, It's done.

The order of b,c is changed because k % (length % k) is not 0.

Now every elements before c,b are done (length - length % k).

c,b is a new array whose new_length is length % k

And it's new_k is k % (length % k).

Because new_k elements are swapped with least new_k elements.

So c,b can be arranged recursively!!!
~~~

# ***Better Solution in the Forum***

*With exactly the same number of operations*, Each element is moved to a temporary position
then moved to it's target position.

~~~ console
e.g. length = 14, k = 3

1,2,3,4,5,6,7,8,9,a,b,c,d,e

reverse it gives

e,d,c,b,a,9,8,7,6,5,4,3,2,1

The first k elements (e,d,c) are in their block but in reverse order.
So reverse them and the first k ones are done.

c,d,e, b,a,9,8,7,6,5,4,3,2,1

The first length - k elements are in their block and reverse order TOO!!!
So reverse them too!!!

c,d,e, 1,2,3,4,5,6,7,8,9,a,b

DONE!!!
~~~

# cpp

~~~ cpp
class Solution {
public:
  void rotate(int nums[], int length, int k) {
    int temp_length(length % k);

    int i(0), j(length - k), e(length - temp_length);

    while (i < e) {
      swap(nums[i], nums[j]);

      i += 1;
      j += 1;

      if (j == length) {
        j -= k;
      }
    }

    if (temp_length) {
      k %= temp_length;

      if (k) {
        this->rotate(nums + e, temp_length, k);
      }
    }
  }

  void rotate(vector<int>& nums, int k) {
    if (nums.empty()) {
      return;
    }

    k %= nums.size();

    if (k == 0) {
      return;
    }

    this->rotate(&nums[0], nums.size(), k);
  }
};
~~~

# javascript

~~~ javascript
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {void} Do not return anything, modify nums in-place instead.
 */

var reverse = function(nums, b, e) {
  var t;

  while (b < e) {
    t = nums[b];
    nums[b] = nums[e];
    nums[e] = t;

    b += 1;
    e -= 1;
  }
};

var rotate = function(nums, k) {
  if (nums.length === 0) {
    return;
  }

  k %= nums.length;

  if (k === 0) {
    return;
  }

  reverse(nums, 0, nums.length - 1);
  reverse(nums, k, nums.length - 1);
  reverse(nums, 0, k - 1);
};
~~~

# python

~~~ python
class Solution:
    def reverse(self, nums, b, e) :
        while b < e :
            t = nums[b]
            nums[b] = nums[e]
            nums[e] = t

            b += 1;
            e -= 1;

    # @param {integer[]} nums
    # @param {integer} k
    # @return {void} Do not return anything, modify nums in-place instead.
    def rotate(self, nums, k):
        if len(nums) == 0 :
            return

        k %= len(nums)

        if k == 0 :
            return

        self.reverse(nums, 0, len(nums) - 1)
        self.reverse(nums, k, len(nums) - 1)
        self.reverse(nums, 0, k - 1)
~~~

# ruby

~~~ ruby
# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
def reverse(nums, b, e)
  while b < e
    nums[b], nums[e] = nums[e], nums[b]

    b += 1
    e -= 1
  end
end

def rotate(nums, k)
  return if nums.length.zero?

  k %= nums.length

  return if k.zero?

  reverse(nums, 0, nums.length - 1)
  reverse(nums, k, nums.length - 1)
  reverse(nums, 0, k - 1)
end
~~~
