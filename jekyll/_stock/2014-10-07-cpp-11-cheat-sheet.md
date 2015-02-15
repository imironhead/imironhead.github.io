---
layout: post
title: "C++ 11 Cheat Sheet"
description: ""
category:
tags: ["cpp", "programming"]
---

### Rvalue references and move constructors

* [A Brief Introduction to Rvalue References](http://www.artima.com/cppsource/rvalue.html)
* rvalue reference (&&): Type&& t = s;
* move => move resource from somewhere to elsewhere.

~~~ cpp
class A {
public:
  A() { cout << "A()" << endl; }
  A(A&& a) { cout << "A(A&&)" << endl; }

  A& operator= (A&& a) {
    cout << "operator=(A&&)" << endl;
    return *this;
  }
};

A foo() {
  // local A is temporary.
  return A();
}

int main() {
  // => A()
  A a;

  // => A(A&&)
  A b(move(a));

  // foo => A()
  // a = => operator=(A&&)
  a = foo();
}
~~~

------------

### constexpr – Generalized constant expressions

~~~ cpp
// tell compiler that return value of get_five is always the same.
// can be optimized in compile-time.
constexpr int get_five() {return 5;}
~~~

------------

### Modification to the definition of plain old data

* [wiki: Plain old data structure](http://en.wikipedia.org/wiki/Plain_old_data_structure)

------------

### Extern template

Enhance build time performance since compiler does not have to instantiate the
template everywhere.

~~~ cpp
// tell compiler you can find MyVector<int> somewhere
extern template class MyVector<int>;

void Foo(MyVector<int>& v) {}

// make MyVector<int> available to clients
template class MyVector<int>;
~~~

------------

### Initializer lists

C++03 allows initializer-lists only on structs and classes that conform to the
Plain Old Data (POD) definition.

~~~ cpp
class SequenceClass {
public:
  // initializer-list-constructor
  SequenceClass(std::initializer_list<int> list);
};

SequenceClass some_var = {1, 4, 5, 6};

// initializer_list is a real type
void function_name(std::initializer_list<float> list);

function_name({1.0f, -3.45f, -0.4f});

// standard containers
std::vector<std::string> v = { "xyzzy", "plugh", "abracadabra" };
std::vector<std::string> v({ "xyzzy", "plugh", "abracadabra" });
std::vector<std::string> v{ "xyzzy", "plugh", "abracadabra" };
~~~

------------

### Uniform initialization {...}

~~~ cpp
//
struct BasicStruct {
  int x;
  double y;
};

BasicStruct var1{5, 3.2};

//
struct AltStruct {
  AltStruct(int x, double y) : x_{x}, y_{y} {}

private:
  int x_;
  double y_;
};

AltStruct var2{2, 4.3};

// in function
struct IdString {
  std::string name;
  int identifier;
};

IdString get_string() {
  //Note the lack of explicit type.
  return {"foo", 42};
}

// if there is a constructor with initializer_list, compiler use it.
// if not, compiler find the constructor that meet the parameters.
// below codes construct a vector with one integer.
// use the_vec(4) to constructor a vector with 4 integers.
std::vector<int> the_vec{4};
~~~

------------

### Type inference

~~~ cpp
auto x = 7;               // x is an int

decltype(x) y = 5;        // decltype(x) => int

//
vector<T> rCars;

auto i = rCars.begin();   // i is a vector<T>::iterator
~~~

### range-for statement

work for:

* c-style arrays.
* initializer lists.
* types that have begin() and end() member methods, return iterators.
* types that have begin(const T&) and end(const T&) global methods, return iterators.

~~~ cpp
vector<int> rNumbers;

for (auto x : rNumbers) {
  cout << x << endl;
}

for (auto& x : rNumbers) {
  x += 1;
}

for (auto x : {1, 3, 5, 7, 9}) {
  cout << x << endl;
}
~~~

------------

### Lambda functions and expressions

* [wiki: Anonymous function](http://en.wikipedia.org/wiki/Anonymous_function#C.2B.2B_.28since_C.2B.2B11.29)

* []      : no variables defined. Attempting to use any external variables in the lambda is an error.
* [x, &y] : x is captured by value, y is captured by reference
* [&]     : any external variable is implicitly captured by reference if used
* [=]     : any external variable is implicitly captured by value if used
* [&, x]  : x is explicitly captured by value. Other variables will be captured by reference
* [=, &z] : z is explicitly captured by reference. Other variables will be captured by value

~~~ cpp
// [capture](parameters) -> return_type { function_body }
[](int x, int y) { return x + y; }
~~~

------------

### Alternative function syntax

???

~~~ cpp
// Ret must be the type of lhs+rhs
template<class Lhs, class Rhs>
Ret adding_func(const Lhs &lhs, const Rhs &rhs) {return lhs + rhs;}

// Not legal C++11
template<class Lhs, class Rhs>
decltype(lhs+rhs) adding_func(const Lhs &lhs, const Rhs &rhs) {return lhs + rhs;}

// work around
template<class Lhs, class Rhs>
auto adding_func(const Lhs &lhs, const Rhs &rhs) -> decltype(lhs+rhs) {return lhs + rhs;}
~~~

------------

### Object construction improvement

C++11 allows constructors to call other peer constructors.

~~~ cpp
class SomeType  {
  int number;
public:
  SomeType(int new_number) : number(new_number) {}
  SomeType() : SomeType(42) {}
};

//
class BaseClass {
public:
  BaseClass(int value);
};

class DerivedClass : public BaseClass {
public:
  // let compiler inherit a constructor from BaseClass
  // => generate DerivedClass(int value)
  using BaseClass::BaseClass;
};

// if the constructor never initialize the member 'value', value is 5.
class SomeClass {
public:
  SomeClass() {}
  explicit SomeClass(int new_value) : value(new_value) {}

private:
  // default
  int value = 5;
};
~~~

------------

### Explicit overrides and final

~~~ cpp
struct Base {
  virtual void some_func(float);
};

struct Derived : Base {
  // override: compiler will check the base class(es) to see if there is a
  // virtual function with this exact signature.
  // ill-formed - doesn't override a base class method.
  virtual void some_func(int) override;
};

//
struct Base1 final { };

// ill-formed because the class Base1 has been marked final.
struct Derived1 : Base1 { };

//
struct Base2 {
    virtual void f() final;
};

// ill-formed because the virtual function Base2::f has been marked final.
struct Derived2 : Base2 {
    void f();
};
~~~

------------

### Null pointer constant

~~~ cpp
char *pc = nullptr;     // OK
int  *pi = nullptr;     // OK
bool   b = nullptr;     // OK. b is false.
int    i = nullptr;     // error

foo(nullptr);           // calls foo(nullptr_t), not foo(int);
                        // type of nullptr is nullptr_t
~~~

------------

### Strongly typed enumerations

* enum works as before (but can be scoped).
* enum class / struct is strongly typed, can not be converted to integer.
* size of enum class can be set.

~~~ cpp
// (forward) declaration
enum class Option : char;

// size of Option is size of char, all integer types can be used.
// default is int.
enum class Option : char { A, B, C, D };

Option o = Option::A;
~~~

------------

### Right angle bracket

------------

### Explicit conversion operators

* C++98 added the explicit keyword as a modifier on constructors to prevent
single-argument constructors from being used as implicit type conversion
operators.
* In C++11, the explicit keyword can now be applied to conversion operators.

------------

### Template aliases

~~~ cpp
template <typename First, typename Second, int Third>
class SomeType;

// Illegal in C++03
template <typename Second>
typedef SomeType<OtherType, Second, 5> TypedefName;

// C++11
template <typename Second>
using TypedefName = SomeType<OtherType, Second, 5>;

// Old style
typedef void (*FunctionType)(double);
// New introduced syntax
using FunctionType = void (*)(double);
using INT = int;
~~~

------------

### Unrestricted unions

~~~ cpp
// Required for placement 'new'.
#include <new>

struct Point {
  Point() {}
  Point(int x, int y): x_(x), y_(y) {}
  int x_, y_;
};

union U {
  int z;
  double w;

  // Illegal in C++03; legal in C++11.
  Point p;

  // Due to the Point member, a constructor definition is now required.
  U() { new(&p) Point(); }
};
~~~

------------

### Variadic templates

* [wiki: Variadic templates](http://en.wikipedia.org/wiki/Variadic_template)

~~~ cpp
template<typename... Values> class tuple;

// example
void printf(const char* s) {
  while (s && *s) {
    // make sure that there wasn't meant to be more arguments
    // %% represents plain % in a format string
    if (*s == '%' && *++s != '%') {
      throw runtime_error("invalid format: missing arguments");
    }

    std::cout << *s++;
  }
}

// note the "..."
template<typename T, typename... Args>
void printf(const char* s, T value, Args... args) {
  while (s && *s) {
    // a format specifier (ignore which one it is)
    if (*s == '%' && *++s != '%') {
        // use first non-format argument
				std::cout << value;

        // 'peel off' first argument
        // functional programming
        return printf(++s, args...);
      }

      std::cout << *s++;
    }

  throw std::runtime error("extra arguments provided to printf");
}
~~~

------------

### New string literals (unicode, raw string)

~~~ cpp
u8"I'm a UTF-8 string."
u"This is a UTF-16 string."
U"This is a UTF-32 string."

u8"This is a Unicode Character: \u2018."
u"This is a bigger Unicode Character: \u2018."
U"This is a Unicode Character: \U00002018."

// raw string literal.
// delimiter string allows the user to have ")"
// characters within raw string literals.
R"(The String Data \ Stuff " )"
R"delimiter(The String Data \ Stuff " )delimiter"

u8R"XXX(I'm a "raw UTF-8" string.)XXX"
uR"*(This is a "raw UTF-16" string.)*"
UR"(This is a "raw UTF-32" string.)"
~~~

------------

### User-defined literals

* All user-defined literals have suffixes beginning with an underscore (_).
* User-defined literals can be in namespace.

~~~ cpp
//
Bignum operator"" _x(const char* p) {
  return Bignum(p);
}

void f(Bignum);
f(1234567890123456789012345678901234567890x);

//
namespace Numerics {
  // ...
  class Bignum { /* ... */ };

  namespace literals {
    operator"" X(char const*);
  }
}

using namespace Numerics::literals;
~~~

*** An interesting example: ***

~~~ cpp
class Image {
  uint32_t          w;
  uint32_t          h;
  vector<uint32_t>  rPixels;

public:
  Image() : w(0), h(0) {}

  Image(uint32_t width, uint32_t height) :
    w(width), h(height), rPixels(width * height) {
  }

  uint32_t Width() const { return this->w; }
  uint32_t Height() const { return this->h; }
};

Image operator"" _img(const char* s) {
  uint32_t w = 0;
  uint32_t h = 0;

  while (*s != '.') {
    w = 10 * w + *s - '0';

    s += 1;
  }

  s += 1;

  while (*s) {
    h = 10 * h + *s - '0';

    s += 1;
  }

  return Image(w, h);
}

int main() {
  // must use '.'
  Image image = 320.480_img;

  cout << image.Width() << endl;
}
~~~

------------

### Thread-local storage

[cppreference](http://en.cppreference.com/w/cpp/language/storage_duration)

~~~ cpp
#include <iostream>
#include <string>
#include <thread>
#include <mutex>

// thread_local makes each thread has its own 'rage' instance.

thread_local unsigned int rage = 1;
std::mutex cout_mutex;

void increase_rage(const std::string& thread_name) {
  ++rage;
  std::lock_guard<std::mutex> lock(cout_mutex);
  std::cout << "Rage counter for " << thread_name << ": " << rage << '\n';
}

int main() {
  std::thread a(increase_rage, "a"), b(increase_rage, "b");

  {
    std::lock_guard<std::mutex> lock(cout_mutex);
    std::cout << "Rage counter for main: " << rage << '\n';
  }

  a.join();
  b.join();

  return 0;
}

// Possible output:
// Rage counter for a: 2
// Rage counter for main: 1
// Rage counter for b: 2
~~~

------------

### Explicitly defaulted and deleted special member functions

* C++03: To make non-cpoyable class requires declaring a private copy
constructor and copy assignment operator and not defining them.

~~~ cpp
// The default constructor is explicitly stated.
struct SomeType {
  SomeType() = default;
  SomeType(OtherType value);
};

// non-copyable
struct NonCopyable {
  NonCopyable() = default;
  NonCopyable(const NonCopyable&) = delete;
  NonCopyable & operator=(const NonCopyable&) = delete;
};

// disallow calling a member function with particular parameters
struct NoInt {
  void f(double i);
  void f(int) = delete;
};

// f can only be called with double
struct OnlyDouble {
  void f(double d);
  template<class T> void f(T) = delete;
};
~~~

------------

### Type long long int

* at least as large as a long int, and have no fewer than 64 bits.

------------

### Static assertions


~~~ cpp
template<class T>
struct Check  {
  static_assert(sizeof(int) <= sizeof(T), "T is not big enough!");
};

// checked at every instantiation of the template class Check
template<class Integral>
Integral foo(Integral x, Integral y) {
  static_assert(std::is_integral<Integral>::value, "foo() parameter must be an integral type.");
}
~~~

------------

### Allow sizeof to work on members of classes without an explicit object

~~~ cpp
struct SomeType { OtherType member; };

// Does not work with C++03. Okay with C++11
sizeof(SomeType::member);
~~~

------------

### Control and query object alignment

~~~ cpp
// array of characters, suitably aligned for doubles
alignas(double) unsigned char c[1024];

// align on 16 byte boundary
alignas(16) char[100];

// ints are aligned on n byte boundaries
constexpr int n = alignof(int);
~~~

------------

### Allow garbage collected implementations

???

------------

### Attributes

[[carries_dependency]] ???

~~~ cpp
// f() will never return
void f [[ noreturn ]] () {
  // OK
  throw "error";
}
~~~

------------

### Threading facilities

* std::mutex
* std::recursive_mutex
* std::timed_mutex
* std::unique_lock
* std::defer_lock
* lock

~~~ cpp
#include<thread>

void f();

struct F {
  void operator()();
};

int main() {
  // f() executes in separate thread
  std::thread t1{f};
  // F()() executes in separate thread
  std::thread t2{F()};

  // wait for t1 to terminate
  t1.join();
  // wait for t2 to terminate
  t2.join();
}
~~~

pass arguments and return value

~~~ cpp
// place result in res
void f(vector<double>&, double* res);

struct F {
  vector<double>& v;
  double* res;
  F(vector<double>& vv, double* p) :v{vv}, res{p} { }
  // place result in res
  void operator()();
};

int main() {
	double res1;
	double res2;

  // f(some_vec,&res1) executes in separate thread
  std::thread t1{std::bind(f,some_vec,&res1)};
  // F(some_vec,&res2)() executes in separate thread
  std::thread t2{F(some_vec,&res2)};

  t1.join();
  t2.join();

  std::cout << res1 << ' ' << res2 << '\n';
}
~~~

------------

### Tuple types

* std::tuple_size<T>::value returns the number of elements in the tuple T,
* std::tuple_element<I, T>::type returns the type of the object number I of the tuple T.

~~~ cpp
typedef std::tuple <int, double, long &, const char *> test_tuple;
long lengthy = 12;
test_tuple proof(18, 6.5, lengthy, "Ciao!");

// Assign to 'lengthy' the value 18.
lengthy = std::get<0>(proof);

// Modify the tuple’s fourth element.
std::get<3>(proof) = " Beautiful!";

//
auto record = std::make_tuple("Hari Ram", "New Delhi", 3.5, 'A');
std::string name;
float gpa;
char grade;

// std::ignore helps drop the place name
std::tie(name, std::ignore, gpa, grade) = record ;

std::cout << name << ' ' << gpa << ' ' << grade << std::endl ;
~~~

------------

### Hash tables

* std::unordered_set
* std::unordered_multiset
* std::unordered_map
* std::unordered_multimap

------------

### Regular expressions

~~~ cpp
~~~

------------

~~~ cpp
~~~

------------

~~~ cpp
~~~

------------

~~~ cpp
~~~

------------

~~~ cpp
~~~

------------

~~~ cpp
~~~

------------

~~~ cpp
~~~

------------

~~~ cpp
~~~

------------

~~~ cpp
~~~

------------

~~~ cpp
~~~

------------

~~~ cpp
~~~

------------

~~~ cpp
~~~

------------

~~~ cpp
~~~

------------

~~~ cpp
~~~

------------

~~~ cpp
~~~

------------

~~~ cpp
~~~

------------

~~~ cpp
~~~

------------

# Resource

* [C++11 - the new ISO C++ standard](http://www.stroustrup.com/C++11FAQ.html)
* [wiki: c++11](http://en.wikipedia.org/wiki/C%2B%2B11)

~~~ cpp
~~~
