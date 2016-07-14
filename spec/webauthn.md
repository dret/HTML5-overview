---
layout:   page
category: spec
title:    "Web Authentication: A Web API for accessing scoped credentials"
---

| Current Status | Working Draft (WD)
| Canonical URI | [`http://www.w3.org/TR/webauthn`](http://www.w3.org/TR/webauthn)
| Abstract | This specification defines an API that enables web pages to access WebAuthn compliant strong cryptographic credentials through browser script. Conceptually, one or more credentials are stored on an authenticator, and each credential is scoped to a single Relying Party. Authenticators are responsible for ensuring that no operation is performed without the user’s consent. The user agent mediates access to credentials in order to preserve user privacy. Authenticators use attestation to provide cryptographic proof of their properties to the relying party. This specification also describes a functional model of a WebAuthn compliant authenticator, including its signature and attestation functionality.