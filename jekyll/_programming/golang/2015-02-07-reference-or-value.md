---
layout: post
title: "Reference or Value"
description: ""
category:
tags: ["golang", "programming"]
---

* **array** : value
* **slice** : reference


~~~ go
package main

import (
        "fmt"
)

func testArray(s [3]int) {
        s[0] = 4;
}

func testSlice(s []int) {
        s[0] = 4;
}

func main() {
        a := [3]int{0, 1, 2}
        s := []int{0, 1, 2}

        fmt.Println(a)
        fmt.Println(s)

        testArray(a)
        testSlice(s)

        // a: [0 1 2]
        // s: [4 1 2]
        fmt.Println(a)
        fmt.Println(s)
}
~~~
