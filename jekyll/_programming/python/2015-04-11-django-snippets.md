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

### Stops the template engine from rendering the contents of this block tag.

{% raw %}
~~~ html
{% verbatim %}
{{ }} is still {{ }}
{% endverbatim %}
~~~
{% endraw %}
