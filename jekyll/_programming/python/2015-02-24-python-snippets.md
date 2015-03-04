---
layout: post
title: "Python Code Snippets"
description: ""
category:
tags: ["programming", "python"]
---

## File

### Change Encoding

~~~ python
def change(path) :
  source = ''
  with open(path, 'rb') as origin :
    source = origin.read().decode('big5')
  with open(path, 'w') as target :
    target.write(source)
~~~
