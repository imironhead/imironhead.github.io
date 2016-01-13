---
layout: post
title: "Fibonacci in Go"
description: ""
category:
tags: ["golang", "programming"]
---

Implement fibonacci to evaluate golang.

~~~ go
package main

import (
  "fmt"
  "math/big"
)


type M2 struct {
  e00, e01, e10, e11 big.Int
}

func NewM2(e00, e01, e10, e11 int64) *M2 {
  return &M2 {
    *big.NewInt(e00),
    *big.NewInt(e01),
    *big.NewInt(e10),
    *big.NewInt(e11) }
}

func (m *M2) String() string {
  return fmt.Sprintf(
    "[[ %v, %v ], [ %v, %v ]]", &m.e00, &m.e01, &m.e10, &m.e11)
}

func Add(m, n *M2) *M2 {
  var r M2

  (&r.e00).Add(&m.e00, &n.e00)
  (&r.e01).Add(&m.e01, &n.e01)
  (&r.e10).Add(&m.e10, &n.e10)
  (&r.e11).Add(&m.e11, &n.e11)

  return &r
}

func Mul(m, n *M2) *M2 {
  var r M2

  (&r.e00).Add(new(big.Int).Mul(&m.e00, &n.e00),
               new(big.Int).Mul(&m.e01, &n.e10))
  (&r.e01).Add(new(big.Int).Mul(&m.e00, &n.e01),
               new(big.Int).Mul(&m.e01, &n.e11))
  (&r.e10).Add(new(big.Int).Mul(&m.e10, &n.e00),
               new(big.Int).Mul(&m.e11, &n.e10))
  (&r.e11).Add(new(big.Int).Mul(&m.e10, &n.e01),
               new(big.Int).Mul(&m.e11, &n.e11))

  return &r
}

func IsOdd(i *big.Int) bool {
  return 1 == new(big.Int).Mod(i, big.NewInt(2)).Cmp(big.NewInt(0))
}

func Pow(m *M2, p *big.Int) *M2 {
  if p.Cmp(big.NewInt(1)) == 0 {
    // should ???
    t := *m
    return &t
  } else {
    t := Pow(m, new(big.Int).Div(p, big.NewInt(2)))

    t = Mul(t, t)

    if IsOdd(p) {
      t = Mul(t, m)
    }

    return t
  }
}

func Fib(i *big.Int) *big.Int {
  return &Pow(NewM2(0, 1, 1, 1), i).e10
}

func main() {
  fmt.Println(Fib(big.NewInt(1000)))
}
~~~
