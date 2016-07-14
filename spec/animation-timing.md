---
layout:   page
category: spec
title:    "Timing Control for Script-Based Animations"
---

| Current Status | Note (NOTE)
| Canonical URI | [`http://www.w3.org/TR/animation-timing`](http://www.w3.org/TR/animation-timing)
| Abstract | This document defines an API web page authors can use to write script-based animations where the user agent is in control of limiting the update rate of the animation. The user agent is in a better position to determine the ideal animation rate based on whether the page is currently in a foreground or background tab, what the current load on the CPU is, and so on. Using this API should therefore result in more appropriate utilization of the CPU by the browser.