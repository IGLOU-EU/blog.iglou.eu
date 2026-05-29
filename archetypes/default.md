---
draft: true
title: "{{ with getenv "HUGO_NEWTITLE" }}{{ . }}{{ else }}{{ replace $.Name "-" " " | title }}{{ end }}"
description: ""
miniature: ".webp"
date: {{ .Date }}
fediverseContext: ""
fediverseHashtags:
  - ""
tags: 
  - ""
refs:
  - " []()"
---

# {{ with getenv "HUGO_NEWTITLE" }}{{ . }}{{ else }}{{ replace $.Name "-" " " | title }}{{ end }}

![description](.png "note sous l'image")

## 