{{- define "secrets.dockerregistry" -}}
{
  "auths": {
    {{- range $registry, $conf := .Values.dockerregistry }}
    {{ default $registry $conf.url | quote }}: {
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
    {{- $url := ( default ( printf "{{ .%s_url }}" $registryName ) $conf.url ) }}
    {{- $username := ( default ( printf "{{ .%s_username }}" $registryName ) $conf.username ) }}
    {{- $password := ( default ( printf "{{ .%s_password }}" $registryName ) $conf.password ) }}
    {{- $email := ( default ( printf "{{ .%s_email }}" $registryName ) $conf.email ) }}
    {{ $url | quote }}: {
      {{- if and ( hasKey $conf "username" ) ( hasKey $conf "password" ) }}
      "auth": {{ printf "%s:%s" $conf.username $conf.password | b64enc | quote }},
      {{- else if hasKey $conf "username" }}
      "auth": {{ printf "{{ ( printf \"%s:%s\" .%s_password ) | b64enc | quote }}" $conf.username "%s" $registryName }},
      {{- else if hasKey $conf "password" }}
      "auth": {{ printf "{{ ( printf \"%s:%s\" .%s_username ) | b64enc | quote }}" "%s" $conf.password $registryName }},
      {{- else }}
      "auth": {{ printf "{{ ( printf \"%s:%s\" .%s_username .%s_password ) | b64enc | quote }}" "%s" "%s" $registryName $registryName }},
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
