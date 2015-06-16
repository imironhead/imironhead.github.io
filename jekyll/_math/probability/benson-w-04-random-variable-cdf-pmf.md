---
layout: post
title: "Random Valriable, CDF and PMF"
description: ""
category:
tags: ["math"]
---

## Random Variable (R.V)

* 把 outcome 數字化的表示方式。
* 通當用大學英文字母。
* 是一個函數，不是變數。

X(outcome) = 1 =>

* input: outcome
* output: 數字

### 種類

* Discrete R.V.
* Continuous R.V.

### 隨機變數的函數

W(X(o)) => 把 X(o) 當作 W() 的 outcome

## Comulative Distribution Function (CDF)

\\(\mathbf{F}_X(x) \overset{\underset{\mathrm{def}}{}}{=} \mathbf{P}(\mathbf{X} \le x)\\)

E.G.

Roll a 6 faces dice, the probability to get points less or equal to 4:

\\(\mathbf{F}_X(4) = \mathbf{P}(\mathbf{X} \le 4)\\)

the probability to get pointe greater than 2 but less of equal to 4:

\\(\mathbf{P}(2 < X \le 4) = \mathbf{F}_X(4) - \mathbf{F}_X(2)\\)

### 性質

* \\(\mathbf{F}_X(-\infty) = \mathbf{P}(X \le -\infty) = 0\\)
* \\(\mathbf{F}_X( \infty) = \mathbf{P}(X \le  \infty) = 1\\)
* \\(0 \le \mathbf{F}_X(x) \le 1\\)

Discrete CDF

* \\(\mathbf{F}_X(x^+) = \mathbf{F}_X(x)\\)
* \\(\mathbf{F}_X(x^-) = \mathbf{F}_X(x) - \mathbf{P}(X = x)\\)

Continuous CDF

* \\(\mathbf{F}_X(x^-) = \mathbf{F}_X(x) = \mathbf{F}_X(x^+)\\)

## Probability Mass Function (PMF)

\\(\mathcal{p}_X(x) \overset{\underset{\mathrm{def}}{}}{=} \mathbf{P}(\mathbf{X} = x)\\)

Ex. X 為公平骰子的點數 \\(\mathcal{p}_X(3) = \mathbf{P}(X=3) = \frac{1}{6}\\)

PMF v.s. CDF

$$
  \begin{align}
  \mathbf{F}_X(2.5) & = \mathbf{P}(X \le 2.5) \\
  & = \mathbf{P}(X=2) + \mathbf{P}(X=1) + \mathbf{P}(X=0) + \mathbf{P}(X=-1) + \cdots \\
  & = \sum_{n=-\infty}^{\lfloor 2.5 \rfloor} \mathbf{P}(X = n) \\
  \end{align}
$$

任何一個 PMF 都稱作是一種機率分佈 (Probability Distribution)

## Bernoulli Probability Distribution

\\(X \sim Bernoulli(\mathcal{p})\\)

若實驗成功機率為 \\(\mathcal{p}\\)，做 1 次實驗，X 表示成功次數

$$
  \mathcal{p}(x) = \begin{cases}
  \mathcal{p}, & x = 1 \\
  1 - \mathcal{p}, & x = 0 \\
  0, & \text(otherwise) \\
  \end{cases}

  \mathbf{F}_X(x) = \begin{cases}
  0, & x < 0 \\
  1 - \mathcal{p}, & 0 \le x < 1 \\
  1, & x \ge 1 \\
  \end{cases}
$$

## Binomial Probability Distribution

\\(X \sim BIN(\mathcal{n}, \mathcal{p})\\)

若實驗成功機率為 \\(\mathcal{p}\\)，做 n 次實驗，X 表示成功次數

$$
  \begin{align}
  \mathcal{p}_X(x) & = \mathbf{P}(X = x) \\
  & = \binom{n}{x} \mathcal{p}^x (1 - \mathcal{p})^{n - x}
  \end{align}
$$

## Uniform Probability Distribution

\\(X \sim UNIF(\mathcal{a}, \mathcal{b})\\)

若 X= a, a+1, ..., b 的機率均等

$$
  \mathcal{p}_X(x) = \begin{cases}
  \frac{1}{b - a + 1}, & x = a, a+1, \cdots, b \\
  0, & \text(otherwise) \\
  \end{cases}
$$
