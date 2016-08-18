---
layout:   page
category: spec
title:    "Indexed Database API 2.0"
---

| *Current Status:* | Working Draft (WD)
| *Canonical URI:* | [`http://www.w3.org/TR/IndexedDB-2`](http://www.w3.org/TR/IndexedDB-2)
| *Abstract:* | This document defines APIs for a database of records holding simple values and hierarchical objects. Each record consists of a key and some value. Moreover, the database maintains indexes over records it stores. An application developer directly uses an API to locate records either by their key or by using an index. A query language can be layered on this API. An indexed database can be implemented using a persistent B-tree data structure.