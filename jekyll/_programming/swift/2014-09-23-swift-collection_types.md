---
layout: post
title: "swift 筆記 - Collection Types"
description: ""
category:
tags: ["programming", "swift", "cheat sheet"]
---

用中文記的難度真高，只希望能記完整份 Language Guide，並對英文苦手有些幫助。

- 有 array 跟 dictionary。
- 儲存的變數型別是固定的，不能把 Int 塞進 String 的 Array 裡。
- mutability（可不可改變內容）取決於是 let 或 var。


~~~ swift
// 型別是 Array<SomeType>，等同於 [SomeType]
// 可以用 [obj0， obj1， obj2] 的 literal 初始化。
// 也可以寫成 var shoppingList = ["Eggs", "Milk"]
// var shoppingList = [String]() 則產生一個空的 array
var shoppingList: [String] = ["Eggs", "Milk"]

// shoppingList.count，長度，內含物件數量
println("The shopping list contains \(shoppingList.count) items.")

// isEmpty，這個 array 是不是空的
if shoppingList.isEmpty {
  println("The shopping list is empty.")
}

// 新增物件到 array 的末端
shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

// 把 "Chocolate Spread", "Cheese", "Butter" 換成 "Bananas", "Apples"
// 不需要一樣長
shoppingList[4...6] = ["Bananas", "Apples"]

// 增加一比新的資料到 index 的位置去，
// index及index以後的所有資料的位置都 +1
// 現在變成 [
//   "Maple Syrup", "Eggs", "Milk", "Flour",
//   "Baking Powder", "Bananas", "Apples"]
shoppingList.insert("Maple Syrup", atIndex: 0)

// shoppingList => [
//   "Eggs", "Milk", "Flour", "Baking Powder", "Bananas", "Apples"]
// mapleSyrup => "Maple Syrup"
let mapleSyrup = shoppingList.removeAtIndex(0)

// 移除並傳回最後一筆資料
// shoppingList不能是空的
// 優點：不需要取得 array 目前的長度 => removeAtIndex(length - 1)
let apples = shoppingList.removeLast()

// for in
for item in shoppingList {
    println(item)
}

// for in
for (index, value) in enumerate(shoppingList) {
    println("Item \(index + 1): \(value)")
}

// 讓 shoppingList 變成空的 array，shoppingList 是 [String]，所以可以直接給予 []
shoppingList = []

// [0.0, 0.0, 0.0]
var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
~~~

字典

~~~ swift
// 一個 key 跟 value 都是 String 的 dictionary
// 也可不寫出 type，只要 literal 有明確的 type
// var airports = ["TYO": "Tokyo", "DUB": "Dublin"]
var airports: [String: String] = ["TYO": "Tokyo", "DUB": "Dublin"]

println("The airports dictionary contains \(airports.count) items.")

if airports.isEmpty {
  println("The airports dictionary is empty.")
} else {
  println("The airports dictionary is not empty.")
}

// updateValue 傳回舊的 value 的 optional
if let oldValue = airports.updateValue("Dublin International", forKey: "DUB") {
  println("The old value for DUB was \(oldValue).")
}

// airports["DUB"]傳回一個 optional，因為 key "DUB" 可能不存在
if let airportName = airports["DUB"] {
  println("The name of the airport is \(airportName).")
} else {
  println("That airport is not in the airports dictionary.")
}

// 移除
airports["APL"] = "Apple International"
airports["APL"] = nil

// 如果 airports 裡有 "DUB"，回傳 value 的 optional，移除 "DUB"
if let removedValue = airports.removeValueForKey("DUB") {
  println("The removed airport's name is \(removedValue).")
} else {
  println("The airports dictionary does not contain a value for DUB.")
}

// for in
for (airportCode, airportName) in airports {
  println("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
  println("Airport code: \(airportCode)")
}

for airportName in airports.values {
  println("Airport name: \(airportName)")
}

// Hashable protocol
// 新的 type 需要 hashValue 及 == 才能當作 key
~~~
