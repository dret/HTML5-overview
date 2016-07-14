---
layout:   page
category: spec
title:    "IndieUI: Events 1.0"
---

| Current Status | Working Draft (WD)
| Canonical URI | [`http://www.w3.org/TR/indie-ui-events`](http://www.w3.org/TR/indie-ui-events)
| Abstract | IndieUI: Events 1.0 is an abstraction between physical, device-specific user interaction events and inferred user intent such as scrolling or changing values. This provides an intermediate layer between device- and modality-specific user interaction events, and the basic user interface functionality used by web applications. IndieUI: Events focuses on granular user interface interactions such as scrolling the view, canceling an action, changing the value of a user input widget, selecting a range, placing focus on an object, etc. Implementing platforms will combine modality-specific user input, user idiosyncratic heuristics to determine the specific corresponding Indie UI event, and send that to the web application in addition to the modality-specific input such as mouse or keyboard events, should applications wish to process it.