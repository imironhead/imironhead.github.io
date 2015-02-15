---
layout: post
title: "C++ 14 Cheat Sheet"
description: ""
category:
tags: ["cpp", "programming"]
---

### auto

~~~ cpp
// type of return value of function can be auto if compiler knows it.
// use it to reduce efforts of refactoring.
auto foo() {
  return 1.0;
}
~~~

------------

### auto + lambda

~~~ cpp
auto adder = [](auto op1, auto op2) { return op1 + op2; };

std::accumulate(vec.begin(), vec.end(), 0, adder);
~~~

------------

### deprecated

~~~ cpp
class [[deprecated]] Zoo {};

[[deprecated("deprecated message")]]
voif foo() {}
~~~

------------

### Binary Literals and Digit Separators

~~~ cpp
int a = 0b010101;
int b = 0x1111'0000'1111;
double c = 1'000'000.00;
~~~

------------

### Variable templates

~~~ cpp
template<typename T>
constexpr T pi = T(3.1415926535897932385);

template<typename T>
T area_of_circle_with_radius(T r) {
  return pi<T> * r * r;
}
~~~

------------

### Shared mutexes and locking

------------

# Resource

* [Dr.Dobb's : The C++14 Standard: What You Need to Know](http://www.drdobbs.com/cpp/the-c14-standard-what-you-need-to-know/240169034?pgno=1)
* [wiki: c++14](http://en.wikipedia.org/wiki/C%2B%2B14)
* [C++ Rocks! An overview of C++14 language features](http://cpprocks.com/an-overview-of-c14-language-features/)
