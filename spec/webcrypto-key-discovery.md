---
layout:   page
category: spec
title:    "WebCrypto Key Discovery"
---

| *Current Status:* | Note (NOTE)
| *Canonical URI:* | [`http://www.w3.org/TR/webcrypto-key-discovery`](http://www.w3.org/TR/webcrypto-key-discovery)
| *Abstract:* | This note describes a JavaScript API for discovering named, origin-specific pre-provisioned cryptographic keys for use with the Web Cryptography API. Pre-provisioned keys are keys which have been made available to the UA by means other than the generation, derivation, importation and unwrapping functions of the Web Cryptography API. Origin-specific keys are keys that are available only to a specified origin. Named keys are identified by a name assumed to be known to the origin in question and provisioned with the key itself. This note concerns only keys which have all three of these properties.