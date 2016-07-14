---
layout:   page
category: spec
title:    "Indexed Database API"
---

| Current Status | Recommendation (REC)
| Canonical URI | [`http://www.w3.org/TR/IndexedDB`](http://www.w3.org/TR/IndexedDB)
| Abstract | This document defines APIs for a database of records holding simple values and hierarchical objects. Each record consists of a key and some value. Moreover, the database maintains indexes over records it stores. An application developer directly uses an API to locate records either by their key or by using an index. A query language can be layered on this API. An indexed database can be implemented using a persistent B-tree data structure.