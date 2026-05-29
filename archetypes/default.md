---
draft: true
title: "{{ with getenv "HUGO_NEWTITLE" }}{{ . }}{{ else }}{{ replace $.Name "-" " " | title }}{{ end }}"
description: ""
miniature: ".webp"
date: {{ .Date }}
fediverse_context: ""
fediverse_hashtags:
  - ""
tags: 
  - ""
refs:
  - " []()"
---

# {{ with getenv "HUGO_NEWTITLE" }}{{ . }}{{ else }}{{ replace $.Name "-" " " | title }}{{ end }}

![description](.png "note sous l'image")

## 