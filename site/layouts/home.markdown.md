---
title: {{ .Title | jsonify }}
description: {{ .Description | jsonify }}
{{- with .Params.track }}
track: {{ . | jsonify }}
{{- end }}
{{- with .Params.tags }}
tags: {{ . | jsonify }}
{{- end }}
{{- if not .Date.IsZero }}
date: {{ .Date.Format "2006-01-02" }}
{{- end }}
{{- with .Params.status }}
status: {{ . | jsonify }}
{{- end }}
source: {{ partial "note-meta.txt" . | jsonify }}
html: {{ .Permalink | jsonify }}
---

{{ .RawContent }}
