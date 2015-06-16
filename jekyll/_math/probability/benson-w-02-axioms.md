---
layout: post
title: "Axioms"
description: ""
category:
tags: ["math"]
---

# Axioms of Probability （公理）

* For any event A, \\(\mathbf{P}(\mathbf{A}) \ge 0\\)
* For sample space S, \\(\mathbf{P}(\mathbf{S}) = 0\\)
* Events \\(E_1, E_2, E_3, ...\\) are mutually exclusive, then \\(\mathbf{P}(E_1 \cup E_2 \cup E_3 \cup ...)\\) = \\(\mathbf{P}(E_1) + \mathbf{P}(E_2) + \mathbf{P}(E_3) + ...\\)

## Derive

\\(\mathbf{E} = \lbrace o_1, o_2, o_3, ... \rbrace\\)

\\(\Rightarrow\\)

\\(\mathbf{P}(\mathbf{E}) = \mathbf{P}(o_1) + \mathbf{P}(o_2) + \mathbf{P}(o_3) + ...\\)

## Derive

\\(\mathbf{P}(\mathbf{\phi}) = 0\\)

證明：

\\(\mathbf{S} \cap \mathbf{\phi} = \phi \Rightarrow \mathbf{S}, \mathbf{\phi}\\) are disjoint

and \\( \mathbf{S} = \mathbf{S} \cup \mathbf{\phi} \\)

\\(\Rightarrow \mathbf{P}(\mathbf{S}) = \mathbf{P}(\mathbf{S} \cup \mathbf{\phi}) = \mathbf{P}(\mathbf{S}) + \mathbf{P}(\mathbf{\phi}) \\)

\\(\Rightarrow \mathbf{P}(\mathbf{\phi}) = 0\\)

## Derive

\\(\mathbf{P}(\mathbf{A}) = 1 - \mathbf{P}(A^c)\\)

證明：

\\(\mathbf{A} \cap \mathbf{A^c} = \phi \Rightarrow A, A^c\\) are disjoint

and \\(\mathbf{S} = \mathbf{A} \cup \mathbf{A^c}\\)

\\(\Rightarrow \mathbf{P}(\mathbf{S}) = \mathbf{P}(\mathbf{A}) + \mathbf{P}(\mathbf{A}^c)\\)

\\(\Rightarrow 1 = \mathbf{P}(\mathbf{A}) + \mathbf{P}(\mathbf{A}^c) \Rightarrow \mathbf{P}(\mathbf{A}) = 1 - \mathbf{P}(\mathbf{A}^c)\\)

## Derive

\\(\mathbf{P}(\mathbf{A}) = \mathbf{P}(\mathbf{A} - \mathbf{B}) + \mathbf{P}(\mathbf{A} \cap \mathbf{B})\\)

證明：

\\(\mathbf{A} = (\mathbf{A} - \mathbf{B}) \cup (\mathbf{A} \cap \mathbf{B})\\)

\\(\Rightarrow \mathbf{P}(\mathbf{A}) = \mathbf{P}(\mathbf{A} - \mathbf{B}) + \mathbf{P}(\mathbf{A} \cap \mathbf{B})\\)

## Derive

\\(\mathbf{P}(\mathbf{A} \cup \mathbf{B}) = \mathbf{P}(\mathbf{A}) + \mathbf{P}(\mathbf{B}) - \mathbf{P}(\mathbf{A} \cap \mathbf{B})\\)

證明：

\\(\mathbf{P}(\mathbf{A} - \mathbf{B}) = \mathbf{P}(\mathbf{A}) - \mathbf{P}(\mathbf{A} \cap \mathbf{B})\\)

\\(\mathbf{P}(\mathbf{A} \cap \mathbf{B}) + \mathbf{P}(\mathbf{B} - \mathbf{A}) = \mathbf{P}(\mathbf{B})\\)

\\(\mathbf{P}(\mathbf{A} \cup \mathbf{B}) = \mathbf{P}(\mathbf{A} - \mathbf{B}) + \mathbf{P}(\mathbf{A} \cap \mathbf{B}) + \mathbf{P}(\mathbf{B} - \mathbf{A}) = \mathbf{P}(\mathbf{A}) + \mathbf{P}(\mathbf{B}) - \mathbf{P}(\mathbf{A} \cap \mathbf{B})\\)

## Derive

If \\(C_1, C_2, ..., C_n\\) are disjoint and \\(C_1 \cup C_2 \cup ... \cup C_n = \mathbf{S}\\)

\\(\Rightarrow\\)

\\(\mathbf{P}(\mathbf{A}) = \mathbf{P}(\mathbf{A} \cap \mathbf{C_1}) + \mathbf{P}(\mathbf{A} \cap \mathbf{C_2}) + ... + \mathbf{P}(\mathbf{A} \cap \mathbf{C_n})\\)

## Derive

if \\(\mathbf{A} \subset \mathbf{B}\\), then \\(\mathbf{P}(\mathbf{A}) < \mathbf{P}(\mathbf{B})\\)

證明：

\\(\mathbf{A} \subset \mathbf{B} \rightarrow \mathbf{P}(\mathbf{B} - \mathbf{A}) > 0\\)

\\(\mathbf{A}\\) and \\(\mathbf{B} - \mathbf{A}\\) are disjoint

\\(\mathbf{P}(\mathbf{B}) = \mathbf{P}(\mathbf{A}) + \mathbf{P}(\mathbf{B} - \mathbf{A})\\)

\\(\mathbf{P}(\mathbf{A}) < \mathbf{P}(\mathbf{B})\\)

## Derive

\\(\mathbf{P}(\bigcup_{i=1}^n A_i) \le \sum_{i=1}^n \mathbf{P}(A_i) \\)

證明：

$$
  \begin{align}
  \mathbf{P}(\bigcup_{i=1}^n A_i) & = \mathbf{P}(A_1 \cup \bigcup_{i=2}^n A_i) \\
  & = \mathbf{P}(A_1) + \mathbf{P}(\bigcup_{i=2}^n A_i) - \mathbf{P}(A_1 \cap \bigcup_{i=2}^n A_i) \\
  & = \mathbf{P}(A_1) + \mathbf{P}(A_2) + \cdots + \mathbf{P}(A_n) - \mathbf{P}(A_1 \cap \bigcup_{i=2}^n A_i) - \mathbf{P}(A_2 \cap \bigcup_{i=3}^n A_i) - \cdots - \mathbf{P}(A_(n-1) \cap A_n) \\
  & = \sum_{i=1}^n \mathbf{P}(A_i) - \cdots \\
  & \le \sum_{i=1}^n \mathbf{P}(A_i)
  \end{align}
$$

## Derive

\\(\mathbf{P}(\bigcap_{i=1}^n A_i) \ge 1 - \sum_{i=1}^n \mathbf{P}(A_i^c) \\)

證明：

$$
  \begin{align}
  \mathbf{P}(\bigcap_{i=1}^n A_i) & = \mathbf{P}(A_1 \cap \bigcap_{i=2}^n A_i) \\
  & = \mathbf{P}(A_1) + \mathbf{P}(\bigcap_{i=2}^n A_i) - \mathbf{P}(A_1 \cup \bigcap_{i=2}^n A_i) \\
  & = \mathbf{P}(A_1) + \mathbf{P}(A_2) + \mathbf{P}(\bigcap_{i=3}^n A_i) - \mathbf{P}(A_1 \cup \bigcap_{i=2}^n A_i) - \mathbf{P}(A_2 \cup \bigcap_{i=3}^n A_i) \\

  & = \mathbf{P}(A_1) + \mathbf{P}(A_2) + \cdots + \mathbf{P}(A_{n-1}) + \mathbf{P}(A_n) - \mathbf{P}(A_1 \cup \bigcap_{i=2}^n A_i) - \mathbf{P}(A_2 \cup \bigcap_{i=3}^n A_i) - \cdots - \mathbf{P}(A_{n-1} \cup A_n) \\

  & = (1 - \mathbf{P}(A_1^c)) + (1 - \mathbf{P}(A_2^c)) + \cdots + (1 - \mathbf{P}(A_n^c)) - \mathbf{P}(A_1 \cup \bigcap_{i=2}^n A_i) - \mathbf{P}(A_2 \cup \bigcap_{i=3}^n A_i) - \cdots - \mathbf{P}(A_{n-1} \cup A_n) \\

  & = 1 + (n - 1) - \sum_{i=1}^n \mathbf{P}(A_i^c) - \cdots \\

  & \ge 1 - \sum_{i=1}^n \mathbf{P}(A_i^c)
  \end{align}
$$

# Conditional Probability

\\( \mathbf{P}(X \mid Y) \\) : P of X given Y

* X : 所關心的事件
* Y : 條件（觀察到的、已發生的事件）

\\(\mathbf{P}(X \mid Y) = \frac{\mathbf{P}(X \cap Y)}{\mathbf{P}(Y)}\\)

## 性質

* \\(\mathbf{P}(X \mid Y) = \frac{\mathbf{P}(X \cap Y) \ge 0}{\mathbf{P}(Y) \ge 0} \ge 0\\)

* \\(\mathbf{P}(Y \mid Y) = \frac{\mathbf{P}(Y \cap Y)}{\mathbf{P}(Y)} = \frac{\mathbf{P}(Y)}{\mathbf{P}(Y)} = 1\\)

* A and B are disjoint \\(\Rightarrow \mathbf{P}(A \cup B \mid Y) = \frac{\mathbf{P}(A)}{\mathbf{P}(Y)} + \frac{\mathbf{P}(B)}{\mathbf{P}(Y)} = \mathbf{P}(A \mid Y) + \mathbf{P}(B \mid Y)\\)

## Total Probability

If \\(C_1, C_2, \cdots , C_n\\) are disjoint and \\(C_1 \cap C_2 \cap \cdots C_n = \mathbf{S}\\), for any event A \\(\Rightarrow\\)

\\(\mathbf{P}(A) = \mathbf{P}(A \mid C_1) \mathbf{P}(C_1) + \mathbf{P}(A \mid C_2) \mathbf{P}(C_2) + \cdots + \mathbf{P}(A \mid C_n) \mathbf{P}(C_n)\\)

證明：

$$
  \begin{align}

  \mathbf{P}(A) & = \sum_{i=1}^n \mathbf{P}(A \cap C_i) \\
  & = \sum_{i=1}^n \mathbf{P}(A \mid C_i) \mathbf{P}(C_i) \\

  \end{align}
$$

## Bayes' Rule

If \\(C_1, C_2, \cdots , C_n\\) are disjoint and \\(C_1 \cap C_2 \cap \cdots C_n = \mathbf{S}\\), for any event A \\(\Rightarrow\\)

$$
\mathbf{P}(C_j \mid A) = \frac{\mathbf{P}(A \mid C_j) \mathbf{P}(C_j)}{\sum_{i=1}^n \mathbf{P}(A \mid C_i) \mathbf{P}(C_i)}
$$

證明：

$$
  \begin{align}
  \mathbf{P}(C_j \mid A) & = \frac{\mathbf{P}(C_j \cap A)}{\mathbf{P}(A)} \\

  & = \frac{\mathbf{P}(A \mid C_j) \mathbf{P}(C_j)}{\sum_{i=1}^n \mathbf{P}(A \mid C_i) \mathbf{P}(C_i)}
  \end{align}
$$
