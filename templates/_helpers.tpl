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
    "fix-end-comma": {"auth": ""}
  }
}
{{- end }}

{{- define "application.secrets.externaldockerregistry" -}}
{
  "auths": {
    {{- range $registryName, $conf := . }}
    {{- $url := ( default ( printf "{{ .%s-url }}" $registryName ) $conf.url ) }}
    {{- $username := ( default ( printf "{{ .%s-username }}" $registryName ) $conf.username ) }}
    {{- $password := ( default ( printf "{{ .%s-password }}" $registryName ) $conf.password ) }}
    {{- $email := ( default ( printf "{{ .%s-email }}" $registryName ) $conf.email ) }}
    {{ $url | quote }}: {
      {{- if and ( hasKey $conf "username" ) ( hasKey $conf "password" ) }}
      "auth": {{ printf "%s:%s" $conf.username $conf.password | b64enc | quote }},
      {{- else if hasKey $conf "username" }}
      "auth": {{ printf "{{ ( printf \"%s:%s\" .%s-password ) | b64enc | quote }}" $conf.username "%s" $registryName }},
      {{- else if hasKey $conf "password" }}
      "auth": {{ printf "{{ ( printf \"%s:%s\" .%s-username ) | b64enc | quote }}" "%s" $conf.password $registryName }},
      {{- else }}
      "auth": {{ printf "{{ ( printf \"%s:%s\" .%s-username .%s-password ) | b64enc | quote }}" "%s" "%s" $registryName $registryName }},
      {{- end }}
      "username": {{ $username | quote }},
      "password": {{ $password | quote }},
      "email": {{ $email | quote }}
    },
    {{- end }}
    "fix-end-comma": {"auth": ""}
  }
}
{{- end }}
