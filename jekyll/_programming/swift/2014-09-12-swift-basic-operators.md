---
layout: post
title: "swift 筆記 - 運算子基礎（operators）"
description: ""
category:
tags: ["programming", "swift"]
---

### = 沒有回傳值

~~~ swift
var a = 0
var b = 0
var c = 0

a = b = c = 10  // 編譯錯誤

if a = b {
  // 所以也沒有機會出現把 == 寫成 = 的錯誤，因為 if 需要 Bool
}
~~~


### % 可以用在浮點數上

~~~ swift
8 % 2.5     // 0.5 => 8 = 2.5 * integer + 0.5
~~~


### === 與 !==

判斷兩個同型別的變數是不是同一個實體（instance）
~~~ swift
var a = Car("1")
var b = Car("1")

if a !== b {
  // a 跟 b 不是同一個 instance
}
~~~


### ?? (Nil Coalescing Operator)

~~~ swift
a ?? b    // a != nil ? a! : b  的簡化版
          //  a必需是 optioanal型別， b的型別必需跟 a包裝的型別一樣
          // e.g. 如果 a 是 Int?， b就必需是 Int
          // 如果 a是 nil，就傳回 b，否則傳回 a!
~~~


### ... 與 ..< (Range Operators)
~~~ swift
// 印出 1, 2, 3
for i in 1...3 {
  println("\(i)")
}

// 印出 1, 2
for i in 1..<3 {
  println("\(i)")
}
~~~
