---
layout:   page
category: spec
title:    "Web Audio API"
---

| *Current Status:* | Working Draft (WD)
| *Canonical URI:* | [`http://www.w3.org/TR/webaudio`](http://www.w3.org/TR/webaudio)
| *Abstract:* | This specification describes a high-level JavaScript API for processing and synthesizing audio in web applications. The primary paradigm is of an audio routing graph, where a number of AudioNode objects are connected together to define the overall audio rendering. The actual processing will primarily take place in the underlying implementation (typically optimized Assembly/C/C++ code), but direct JavaScript processing and synthesis is also supported. This API is designed to be used in conjunction with other APIs and elements on the web platform, notably: XMLHttpRequest (using the responseType and response attributes). For games and interactive applications, it is anticipated to be used with the canvas 2D and WebGL 3D graphics APIs.