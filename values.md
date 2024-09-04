# HELM secrets configuration

## Properties

- **`global`**
- **`common`**
- **`nameOverride`**: Refer to _[#/definitions/nameOverride](#definitions/nameOverride)_.
- **`fullnameOverride`**: Refer to _[#/definitions/fullnameOverride](#definitions/fullnameOverride)_.
- **`serviceName`**: Refer to _[#/definitions/serviceName](#definitions/serviceName)_.
- **`releaseTrunc`**: Refer to _[#/definitions/releaseTrunc](#definitions/releaseTrunc)_.
- **`prefixTrunc`**: Refer to _[#/definitions/prefixTrunc](#definitions/prefixTrunc)_.
- **`labels`**: Refer to _[#/definitions/labels](#definitions/labels)_.
- **`annotations`**: Refer to _[#/definitions/annotations](#definitions/annotations)_.
- **`metadata`** _(boolean)_: Generate a ConfigMap with some metadata related to the chart.
- **`external`** _(boolean)_: Secrets from external sources.
- **`externalSecrets`** _(object)_: Cannot contain additional properties.
  - **`refreshInterval`** _(string)_: The refresh interval like 1h, 1m, 1s.
  - **`secretStoreRef`** _(object)_: defines which SecretStore to fetch the ExternalSecret data.
  - **`dataFrom`** _(array)_: used to fetch all properties from a specific Provider data.
  - **`data`** _(object)_: Data defines the connection between the Kubernetes Secret keys and the Provider data. Can contain additional properties.
    - **Additional properties** _(object)_: defines the connection between the Kubernetes Secret key and the Provider data. The map key became the secretKey.
- **`secrets`** _(object)_: Secrets configuration. Can contain additional properties.
  - **Additional properties**
    - **One of**
      - _object_: Secret from a direct value. Cannot contain additional properties.
        - **`type`** _(string)_: Type of the secret. Must be one of: `["value"]`. Default: `"value"`.
        - **`value`** _(string)_: Value of the secret.
      - _object_: Secret for a basic authentication. Cannot contain additional properties.
        - **`type`** _(string)_: Type of the secret. Must be one of: `["basicAuth"]`.
        - **`user`** _(string)_: Username.
        - **`password`** _(string)_: Password.
- **`dockerregistryRefreshInterval`** _(string)_: The refresh interval like 1h, 1m, 1s.
- **`dockerregistrySecretStoreRef`** _(object)_: defines which SecretStore to fetch the ExternalSecret data.
- **`dockerregistry`** _(object)_: Docker registries authentication. Can contain additional properties.
  - **Additional properties** _(object)_: Cannot contain additional properties.
    - **`username`** _(string)_: Username.
    - **`password`** _(string)_: Password.
    - **`email`** _(string)_: Email.
    - **`url`** _(string)_: URL, used only for external secret.
    - **`externalUsername`** _(string)_: Key of the external secret for the username.
    - **`externalPassword`** _(string)_: Key of the external secret for the password.
    - **`externalEmail`** _(string)_: Key of the external secret for the email.
    - **`externalUrl`** _(string)_: Key of the external secret for the URL.
- **`configMap`** _(object)_: ConfigMap configuration. Can contain additional properties.
  - **Additional properties**
    - **One of**
      - _object_: ConfigMap value. Cannot contain additional properties.
        - **`type`** _(string)_: Type of the ConfigMap. Must be one of: `["string"]`. Default: `"string"`.
        - **`value`** _(string)_: Value of the ConfigMap value.
      - _object_: ConfigMap YAML value. Cannot contain additional properties.
        - **`type`** _(string)_: Type of the ConfigMap. Must be one of: `["yaml"]`.
        - **`value`** _(object)_: Value of the ConfigMap value as YAML.
      - _object_: ConfigMap JSON value. Cannot contain additional properties.
        - **`type`** _(string)_: Type of the ConfigMap. Must be one of: `["json"]`.
        - **`value`** _(object)_: Value of the ConfigMap value as JSON.

## Definitions

- <a id="definitions/nameOverride"></a>**`nameOverride`** _(string)_: [helm-common] Override the name.
- <a id="definitions/fullnameOverride"></a>**`fullnameOverride`** _(string)_: [helm-common] Override the fullname.
- <a id="definitions/releaseTrunc"></a>**`releaseTrunc`** _(integer)_: [helm-common] The release trunk length. Default: `20`.
- <a id="definitions/prefixTrunc"></a>**`prefixTrunc`** _(integer)_: [helm-common] The prefix trunk length (release and chart name). Default: `40`.
- <a id="definitions/serviceName"></a>**`serviceName`** _(string)_: [helm-common] The name of the service (not Kubernetes service), this will postfix the name.
- <a id="definitions/labels"></a>**`labels`** _(object)_: [helm-common] Pod labels. Can contain additional properties.
  - **Additional properties** _(string)_
- <a id="definitions/annotations"></a>**`annotations`** _(object)_: [helm-common] Pod annotations. Can contain additional properties.
  - **Additional properties** _(string)_
