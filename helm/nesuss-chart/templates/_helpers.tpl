{{/*
Expand the name of the chart. If name is too big, tunc function will chop surpulus charaters (63 max char allowed).
Function trimSuffix will make sure there is not dash "-" symbol at the end.
*/}}
{{- define "nessus.name" }}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels. Must include selectorLabels template. 
*/}}
{{- define "nessus.labels" -}}
{{- include "nessus.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "nessus.selectorLabels" }}
app.kubernetes.io/name: {{ include "nessus.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

