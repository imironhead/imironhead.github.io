---
layout: post
title: "Regular Number Generator"
description: ""
category:
tags: ["c++", "programming"]
---

aka "Hamming numbers", "ugly numbers".

Prime factors of those numbers are 2, 3 or 5.

$$ Ugly = 2^a * 3^b * 5^c $$

$$ 0 <= a, b, c $$

How to implement?

* 1 is the first ugly number.
* If R is an ugly number, then 2*R, 3*R and 5*R are all ugly numbers as well.
* There are many ugly numbers so we need a priority queue to select them in ascending order.
* Suppose R equals to 2^a * 3^b, should 2*R be pushed into the priority queue? Considering another number R' which equals to 2^(a+1) * 3^(b-1), we known that R' < R. So even if both of R' & R are in the priority queue, R' would be selected before R. When R' is selected, 3*R' should be pushed into priority queue at the same time. Which means 3*R' is pushed into queue before 2*R, so we do not have to push 2*R again (3*R' = 2^(a+1) * 3^b = 2*R).
* So every time when a number R is selected, new ugly number should be generated by multiply the selected number with a new factor P, and P must greater or equal to the largest prime factor of R.
* To illustrate the idea, build a tree with root node 1 (the first ugly number). All node values in this tree are their parent values multiple 2, 3, or 5 (e.g. children of 1 are 2, 3 and 5. children of 2 are 2*2, 2*3 and 2*5. etc.). Remove the duplicated numbers and selected remains in ascending order.

{% highlight cpp %}
#include <iostream>
#include <queue>
#include <vector>

using namespace std;


struct Generator {
  priority_queue<int, vector<int>, greater<int>>  pool;

  Generator() {
    this->pool.push(1);
  }

  int Next() {
    int number = this->pool.top();

    this->pool.pop();

    if (number % 5 == 0) {
      this->pool.push(number * 5);
    } else if (number % 3 == 0) {
      this->pool.push(number * 3);
      this->pool.push(number * 5);
    } else {
      this->pool.push(number * 2);
      this->pool.push(number * 3);
      this->pool.push(number * 5);
    }

    return number;
  }
};

int main() {
  Generator g;

  for (int i = 0; i < 100; ++i) {
    cout << g.Next() << endl;
  }
}
{% endhighlight %}
