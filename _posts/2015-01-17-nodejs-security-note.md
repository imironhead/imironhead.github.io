---
layout: post
title: "Node.js Security Note"
description: ""
category:
tags: ["nodejs", "programming"]
---

# Dependency

The version of express is 4.10.6. When this note was made, I still found many code samples for express 3. So I guess this note would also to be deprecated soon.

# Reference

* [Top Overlooked Security Threats To Node.js Web Applications](http://cdn.oreillystatic.com/en/assets/1/event/106/Top%20Overlooked%20Security%20Threats%20To%20Node_js%20Web%20Applications%20Presentation%201.pdf)

# CSRF

* [csurf: Node.js CSRF protection middleware](https://github.com/expressjs/csurf)


~~~javascript
// dependency
{
  "dependencies": {
    "csurf": "^1.6.5"
  }
}

// routes
app.use(csrf());
app.use(function(req, res, next) {
  var token = req.csrfToken();

  // for jade
  res.locals.csrfToken = token;
  // for Angularjs
  res.cookie('XSRF-TOKEN', token);

  next();
});
app.use(function(err, req, res, next) {
  // called if there are errors.
  if (err.code !== "EBADCSRFTOKEN") {
    return next(err);
  }

  // handle CSRF token errors here
  res.status(403);
  res.send("leave me alone~~");

  console.log("bad csrf token");
});
~~~

In forms with method "POST", set a hidden field with name "_csrf":

~~~ javascript
form(method="post", action="/csrf")
  input(type="hidden", name="_csrf", value="#{ csrfToken }")
~~~

Angularjs read cookie 'XSRF-TOKEN' and send it back in header. Extra works are needed for jQuery.

~~~ javascript
html
  head
    meta(name="csrf-token", content="#{ csrfToken }")

    script.
      $(document).ready(function (e) {
        $.ajaxPrefilter(function(options, _, xhr) {
          if (!xhr.crossDomain) {
            var token = $('meta[name="csrf-token"]').attr('content');

            xhr.setRequestHeader("X-CSRF-Token", token);
          }
        });
      });
~~~

**Note: Why setRequestHeader for jQuery**

In most cases, setting _csrf in data field when post via ajax is enough. The problem surfaces when uploading files with "multipart/form-data". If [multiparty](https://github.com/andrewrk/node-multiparty/) is used to handling file uploading, csrf checking happens before form processing which fails every time, because bodyparser ignore multipart form.

# Expose Less Information to Attackers

~~~ javascript
var app = express();

// Disable the useless header "x-powered-by" whose value is "Express".
app.disable("x-powered-by");

// The default session cookie key of express is "connect.sid", change it.
// Secure cookie send session via https only.
// express session always set session a httponly cookie.
app.use(session({
  secret: "do not touch me",
  key: "session_id",
  cookie: {
    secure: true
  }
}));
~~~
