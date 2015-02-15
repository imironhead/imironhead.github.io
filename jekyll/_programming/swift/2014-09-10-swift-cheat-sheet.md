---
layout: post
title: "swift cheat sheet"
description: ""
category:
tags: ["programming", "swift", "cheat sheet"]
---

~~~ swift
// nil coalescing operator
// equals to "a == nil ? b : a!", if type of a is T!, b must be T
a ?? b
~~~

~~~ swift
// closed range operator
// a...b => a must not greater than b. Both a and b are included.
// a..<b => from a to b-1
for i in 1...5 {
  println("\(i)")
}
~~~
