---
layout: post
title: "Django Code Snippets"
description: ""
category:
tags: ["django", "programming", "python"]
---

## Template

### Escape {{ or }}

{% raw %}
~~~ html
{% templatetag openvariable %} message {% templatetag closevariable %}
~~~
{% endraw %}
