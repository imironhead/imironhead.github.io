---
layout: post
title: "Puzzle Challenge from Ayuda"
description: ""
category:
tags: ["puzzle", "programming"]
---

[Puzzle](http://www.ayudasystems.com/Jobs)

The first challenge is super easy since the characters are mapped one-to-one.

The second one is interesting. Looks like base64 encoding but it's not. It's still
easy if you know how to conquer it with brute force. Here is the hint:

{% highlight python %}
# A => jw==
# AA => j5A=
# AAA => j5CR
# AAAAAA => j5CRkpOU
# B => kA==
# BB => kJE=
# BBB => kJGS
# C => kQ==
# CC => kZI=
# CCC => kZKT

# looks like base64
# 3 characters message => 4 characters cipher
# if:
#   message[0 .. 3n    ] is correct => cipher[0 .. 4m    ] will match
#   message[0 .. 3n + 1] is correct => cipher[0 .. 4m + 1] will match
#   message[0 .. 3n + 2] is correct => cipher[0 .. 4m + 2] will match

cipher_text = """
  lcG1ssZzvsS4eHitwsB8ysPS08LJyITO2aGIi77ajNLg4ZDa5ZPc6uPY5pmnm93r4p/08KLl8Obz7K
  jy/qv7+67wsPQBAAQKCvwKuQMOvAIUBA7BDxIWCsYaF9fMy/8OIiQiFRMs1B4p1xnZISorId4jITri
  NzPlOTY0Py/rPEJISTw2RQECAw==
"""
{% endhighlight %}

Their VP contacted me after I sending the answer.
But they are focusing their recruitment efforts on local candidates.
One more thank you letter, but I really appreciate it.
