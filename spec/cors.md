---
layout:   page
category: spec
title:    "Cross-Origin Resource Sharing"
---

| Current Status | Recommendation (REC)
| Canonical URI | [`http://www.w3.org/TR/cors`](http://www.w3.org/TR/cors)
| Abstract | This document defines a mechanism to enable client-side cross-origin requests. Specifications that enable an API to make cross-origin requests to resources can use the algorithms defined by this specification. If such an API is used on http://example.org resources, a resource on http://hello-world.example can opt in using the mechanism described by this specification (e.g., specifying Access-Control-Allow-Origin: http://example.org as response header), which would allow that resource to be fetched cross-origin from http://example.org.