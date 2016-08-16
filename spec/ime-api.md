---
layout:   page
category: spec
title:    "Input Method Editor API"
---

| *Current Status:* | Note (NOTE)
| *Canonical URI:* | [`http://www.w3.org/TR/ime-api`](http://www.w3.org/TR/ime-api)
| *Abstract:* | This specification defines an "IME API" that provides Web applications with scripted access to an IME (input-method editor) associated with a hosting user agent. This IME API includes: an InputMethodContext interface, which provides methods to retrieve detailed data from an in-progress IME composition; and a Composition dictionary, which represents read-only attributes about the current composition, such as the actual text and its style. This API is designed to be used in conjunction with DOM events.