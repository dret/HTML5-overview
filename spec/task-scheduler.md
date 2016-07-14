---
layout:   page
category: spec
title:    "Task Scheduler API Specification"
---

| Current Status | Note (NOTE)
| Canonical URI | [`http://www.w3.org/TR/task-scheduler`](http://www.w3.org/TR/task-scheduler)
| Abstract | This specification defines an API to schedule a task at a specified time. When the indicated time is reached, the application that scheduled the task will be notified via a functional event on a service worker. A task event will be delivered to a service worker, regardless of whether the application is active on user agent. Applications such as an alarm clock or an auto-updater may utilize this API to perform certain action at a specified time.