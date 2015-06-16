---
layout: post
title: "Set and Probability"
description: ""
category:
tags: ["math"]
---

# Set

## Term

* \\( \mathbf{S} \\) : Universal set (all elements are included).
* \\( \mathbf{\phi} \\) : Empty set.
* \\( A \subset B \\) : A is a subset of B.
* \\( A \cap B \\) : Intersection. A && B.
* \\( A \cup B \\) : Union. A or B.
* \\( C = A^c = A' = \bar A \\) : Complement. Every element except As.
* \\( A - B \\) : Difference.

* Disjoint: If \\(A \cap B = \mathbf{\phi}\\), A and B are disjoint.
* Mutually Exclusive: If every set pair in sets \\(X_1, X_2, ... X_n\\) are disjoint, then all sets are mutually exclusive.

## De Morgan's Law

$$ (A \cup B)^c = A^c \cap B^c $$

\\(\rightarrow\\) :

Assume \\(x \in (A \cup B)^c\\)

\\(\Rightarrow x \notin A \cup B\\)

\\(\Rightarrow x \notin A\\) and \\(x \notin B\\)

\\(\Rightarrow x \in A^c\\) and \\(x \in B^c\\)

\\(\Rightarrow x \in A^c \cap B^c\\)

\\(\Rightarrow (A \cup B)^c \subseteq (A^c \cap B^c) \\)


\\(\leftarrow\\) :

Assume \\(x \in A^c \cap B^c\\)

\\(\Rightarrow x \notin A \\) and \\(x \notin B\\)

if \\(x \notin (A \cup B)^c\\)

\\(\Rightarrow x \in A \cup B\\)

\\(\Rightarrow x \in A \\) or \\(x \in B \\)

\\(\rightarrow\leftarrow\\)

Thus \\(x \in (A \cup B)^c\\)

\\(\Rightarrow (A^c \cap B^c) \subseteq (A \cup B)^c \\)

# Probability

## Experiment （實驗）

* procedures （步驟）
* model （模型）
* observations （觀察）

## Outcome （結果）

## Sample Sapce

\\(\mathbf{S}\\)，樣本空間，實驗中所有可能結果的集合

## Event

對實驗結果的描述

## Event Space

所有可能事件組合的集合

\\(\mathbf{S} = \lbrace o_1, o_2, o_3 \rbrace\\)

Event space :

$$
  \begin{Bmatrix}
    \lbrace \rbrace \\
    \lbrace o_1 \rbrace & \lbrace o_2 \rbrace & \lbrace o_3 \rbrace \\
    \lbrace o_1, o_2\rbrace & \lbrace o_2, o_3\rbrace & \lbrace o_3, o_1\rbrace \\
    \lbrace o_1, o_2, o_3\rbrace
  \end{Bmatrix}
$$

## Probability

P(event) = probability

probability is a function who mapped event space to [0, 1]
