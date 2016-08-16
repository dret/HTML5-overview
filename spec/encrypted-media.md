---
layout:   page
category: spec
title:    "Encrypted Media Extensions"
---

| *Current Status:* | Candidate Recommendation (CR)
| *Canonical URI:* | [`http://www.w3.org/TR/encrypted-media`](http://www.w3.org/TR/encrypted-media)
| *Abstract:* | This proposal extends HTMLMediaElement providing APIs to control playback of protected content. The API supports use cases ranging from simple clear key decryption to high value video (given an appropriate user agent implementation). License/key exchange is controlled by the application, facilitating the development of robust playback applications supporting a range of content decryption and protection technologies. This specification does not define a content protection or Digital Rights Management system. Rather, it defines a common API that may be used to discover, select and interact with such systems as well as with simpler content encryption systems. Implementation of Digital Rights Management is not required for compliance with this specification: only the simple clear key system is required to be implemented as a common baseline. The common API supports a simple set of content encryption capabilities, leaving application functions such as authentication and authorization to page authors. This is achieved by requiring content protection system-specific messaging to be mediated by the page rather than assuming out-of-band communication between the encryption system and a license or other server.