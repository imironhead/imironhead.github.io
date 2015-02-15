---
layout: post
title: "xxxxxxxxxxxx phone interview questions"
description: ""
category:
tags: ["puzzle", "programming"]
---

## objective-c and iOS

## c++

### What is the difference between struct and class?
* default access level. struct's default level is public while class' is private.

### What is the difference between pointer and reference?
* There is no null reference in c++.

### How to prevent a class being sub-classed?
* final ([c++11](http://en.cppreference.com/w/cpp/language/final)).

~~~ cpp
// c++11, example given by cppreference
struct A {
  // A::foo is final
  virtual void foo() final;

  // Error: non-virtual function cannot be final
  void bar() final;
};

// struct B is final
struct B final : A {
  // Error: foo cannot be overridden as it's final in A
  void foo();
};

// Error: B is final
struct C : B {
};
~~~

* private constructor with virtual constructor.

~~~ cpp
class A {
private:
  A();

public:
  A& CreateA();
}
~~~

### How to prevent a constructor throw exceptions?
* noexcept ([c++11](http://www.stroustrup.com/C++11FAQ.html#noexcept)).

### Why should we prevent exceptions from leaving destructors?
* Effective C++, 3rd, Item 8: Prevent exceptions from leaving destructors.
* Asume destructor of class T throw exceptions, then destruction of vector<T>
results in undefined behavior. (vector call destructor of T one by one, if the
first destruction throws, neither the exception is handled or the others are
destructed)

### Why private inheritance?
* Effective C++, 3rd, Item 39: Use private inheritance judiciously. "If you make
a class D privately inherit from a class B, you do so because you are
interested in taking advantage of some of the features available in class B,
not because there is any conceptual relationship between objects of types B
and D."
* Everything in private super class become private in subclass.

### Size of null struct?
* 1
* I don't know why. Just tried it before (both VC & xcode).

### Size of null struct with one function?
* 1 (a non-virtual member function is like a global function with this call,
the class does not need any space to keep it).
* If there are virtual functions, the size is size of pointer
(need a pointer to virtual table).

### How virtual function works?
* A object of type with virtual functions need a pointer point to a virtual
table. All function pointer of its virtual functions are on this table.

### Why virtual inheritance?
* Asume there is a class Root and class A and class B. Both A and B are inherited
from Root. Then There is a new class C inherited from both A and B. C has 2 copies
of Root if A and B are not virtually inherited from Root.

### If class A and class B are inherited from R and you need features of both A and B, what pattern do you need?
* Composite.

### How does namespace works?

### What is namespace pollution?

### Why use pointer to implementation?

### How to make anonymous class?
