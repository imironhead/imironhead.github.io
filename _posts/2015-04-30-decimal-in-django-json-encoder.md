---
layout: post
title: "Decimal in Django JSON Encoder"
description: ""
category:
tags: ["python", "django"]
---

I am developing a "desktop" application running on "browser" using "django". When
I need json response, I use django's JsonResponse class. JsonResponse encode a dictionary
into json format and it handle datetime and decimal types. The problem is JsonResponse
encodes decimal to strings. I found some posts said this issue began after django stoped
using simplejson. What makes django translate decimals into strings? What if I
want numbers, not strings in json? I finally managed to solve it in a not-that-smart
way and here it is.

# How does django's JsonResponse encode dictionaries?

[django 1.7 JsonResponse](https://github.com/django/django/blob/stable/1.7.x/django/http/response.py)

JsonResponse use python's json library and DjangoJSONEncoder (default).

~~~ python
import json

...

class JsonResponse(HttpResponse):
    """
    An HTTP response class that consumes data to be serialized to JSON.
    :param data: Data to be dumped into json. By default only ``dict`` objects
      are allowed to be passed due to a security flaw before EcmaScript 5. See
      the ``safe`` parameter for more information.
    :param encoder: Should be an json encoder class. Defaults to
      ``django.core.serializers.json.DjangoJSONEncoder``.
    :param safe: Controls if only ``dict`` objects may be serialized. Defaults
      to ``True``.
    """

    def __init__(self, data, encoder=DjangoJSONEncoder, safe=True, **kwargs):
        if safe and not isinstance(data, dict):
            raise TypeError('In order to allow non-dict objects to be '
                'serialized set the safe parameter to False')
        kwargs.setdefault('content_type', 'application/json')
        data = json.dumps(data, cls=encoder)
        super(JsonResponse, self).__init__(content=data, **kwargs)
~~~

What DjangoJSONEncoder does is checking the variables which can not be encoded into
json by python's json library. Its' "default" method is a fallback. In my case, it
changes a decimal to a string.

[django 1.7 DjangoJSONEncoder](https://github.com/django/django/blob/stable/1.7.x/django/core/serializers/json.py)

~~~ python
class DjangoJSONEncoder(json.JSONEncoder):
    """
    JSONEncoder subclass that knows how to encode date/time and decimal types.
    """
    def default(self, o):
        # See "Date Time String Format" in the ECMA-262 specification.
        if isinstance(o, datetime.datetime):
            r = o.isoformat()
            if o.microsecond:
                r = r[:23] + r[26:]
            if r.endswith('+00:00'):
                r = r[:-6] + 'Z'
            return r
        elif isinstance(o, datetime.date):
            return o.isoformat()
        elif isinstance(o, datetime.time):
            if is_aware(o):
                raise ValueError("JSON can't represent timezone-aware times.")
            r = o.isoformat()
            if o.microsecond:
                r = r[:12]
            return r
        elif isinstance(o, decimal.Decimal):
            return str(o)
        else:
            return super(DjangoJSONEncoder, self).default(o)
~~~

In python's json encoder, _iterencode do not encode decimal so it ask the default
function to change it into another iteratable type, then encode it again (recursively).
DjangoJSONEncoder's default then give it a string and the decimals finally become strings.

[python 2.7 cpython/Lib/json/encoder.py](https://github.com/python/cpython/blob/2.7/Lib/json/encoder.py)

~~~ python
def _iterencode(o, _current_indent_level):
    if isinstance(o, basestring):
        yield _encoder(o)
    elif o is None:
        yield 'null'
    elif o is True:
        yield 'true'
    elif o is False:
        yield 'false'
    elif isinstance(o, (int, long)):
        yield str(o)
    elif isinstance(o, float):
        yield _floatstr(o)
    elif isinstance(o, (list, tuple)):
        for chunk in _iterencode_list(o, _current_indent_level):
            yield chunk
    elif isinstance(o, dict):
        for chunk in _iterencode_dict(o, _current_indent_level):
            yield chunk
    else:
        if markers is not None:
            markerid = id(o)
            if markerid in markers:
                raise ValueError("Circular reference detected")
            markers[markerid] = o
        o = _default(o)
        for chunk in _iterencode(o, _current_indent_level):
            yield chunk
        if markers is not None:
            del markers[markerid]
~~~

# Quick solution: float

The first solution I found in stackoverflow is making a new class which inherit from DjangoJSONEncoder and return decimal's float version. This works if I do not need the fixed point number.

~~~ console
>>> str(Decimal(1.1))
'1.100000000000000088817841970012523233890533447265625'
~~~

# Final solution: simplejson

Install simplejson (easy_install simplejson). Then write a new encoder (modified
version of django's). Now the simplejson take care of decimals while I can still
encode the other objects (for example, datetime) in prefered formats if I need to.

~~~ python
import simplejson

def default_json_encoder(o) :
    if isinstance(o, datetime.datetime):
        r = o.isoformat()
        if o.microsecond:
            r = r[:23] + r[26:]
        if r.endswith('+00:00'):
            r = r[:-6] + 'Z'
        return r
    elif isinstance(o, datetime.date):
        return o.isoformat()
    elif isinstance(o, datetime.time):
        if is_aware(o):
            raise ValueError("JSON can't represent timezone-aware times.")
        r = o.isoformat()
        if o.microsecond:
            r = r[:12]
        return r
    else:
        raise TypeError(repr(o) + ' is not JSON serializable')

class JsonResponse(HttpResponse):
    def __init__(self, data, safe=True, **kwargs):
        if safe and not isinstance(data, dict):
            raise TypeError('In order to allow non-dict objects to be '
                'serialized set the safe parameter to False')
        kwargs.setdefault('content_type', 'application/json')
        data = simplejson.dumps(data, default=default_json_encoder)
        super(JsonResponse, self).__init__(content=data, **kwargs)
~~~
