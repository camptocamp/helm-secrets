{{- define "secrets.dockerregistry" -}}
{
  "auths": {
    {{- range $registry, $conf := .Values.dockerregistry }}
    {{ $registry | quote }}: {
      "auth": {{ (printf "%s:%s" $conf.username $conf.password) | b64enc | quote}},
      "username": {{ $conf.username | quote }},
      "password": {{ $conf.password | quote }},
      "email": {{ $conf.email | quote }}
    },
    {{- end }}
    "example.com": {"auth": "bm9wZTpub3Bl"}
  }
}
{{- end }}
