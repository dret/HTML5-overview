---
layout:   page
category: spec
title:    "MediaStream Processing API"
---

| Current Status | Note (NOTE)
| Canonical URI | [`http://www.w3.org/TR/streamproc`](http://www.w3.org/TR/streamproc)
| Abstract | A number of existing or proposed features for the Web platform deal with continuous real-time media: HTML media elements, Synchronization of multiple HTML media elements (e.g. proposed HTML MediaController), Capture and recording of local audio and video input (e.g. proposed HTML Streams), Peer-to-peer streaming of audio and video streams (e.g. proposed WebRTC and HTML Streams), and Advanced audio APIs that allow complex mixing and effects processing (e.g. Mozilla's AudioData, Chrome's AudioNode). Many use-cases require these features to work together. This proposal makes HTML Streams the foundation for integrated Web media processing by creating a mixing and effects processing API for HTML Streams.