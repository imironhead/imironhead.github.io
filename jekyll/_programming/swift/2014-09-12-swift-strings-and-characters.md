---
layout: post
title: "swift 筆記 - 字串與字元"
description: ""
category:
tags: ["programming", "swift"]
---

### String 是 value type

所以有動作，包括付值給新變數或傳入函式，都產生新的 instance。（在 obj-c裡是reference）

### 字元

~~~ swift
letyenSign: Character = "¥"   // 是 "¥" （雙引號），不是 '¥'
~~~


### String Interpolation

* \0
* \\
* \t
* \n
* \r
* \"
* \'

~~~ swift
//  \u{unicode}
var a = "\u{24}"        // $
var b = "\u{2665}"      // ♥
var c = "\u{1F496}"     // 💖
~~~

"\\(變數)"，用法同 ruby 的 "#{變數}"
~~~ swift
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
~~~


~~~ swift
~~~
