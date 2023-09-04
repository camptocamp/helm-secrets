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
- **`metadata`** _(boolean)_: Generate a config map with some metadata related to the chart.
- **`secrets`** _(object)_: Secrets configuration. Can contain additional properties.
  - **Additional Properties**
    - **One of**
      - _object_: Secret from a direct value. Cannot contain additional properties.
        - **`type`** _(string)_: Type of the secret. Must be one of: `["value"]`. Default: `"value"`.
        - **`value`** _(string)_: Value of the secret.
      - _object_: Secret for a basic auth. Cannot contain additional properties.
        - **`type`** _(string)_: Type of the secret. Must be one of: `["basicAuth"]`.
        - **`user`** _(string)_: Username.
        - **`password`** _(string)_: Password.
- **`dockerregistry`** _(object)_: Docker registries authentication. Can contain additional properties.
  - **Additional Properties** _(object)_: Cannot contain additional properties.
    - **`username`** _(string, required)_: Username.
    - **`password`** _(string, required)_: Password.
    - **`email`** _(string)_: Email.

## Definitions

- <a id="definitions/nameOverride"></a>**`nameOverride`** _(string)_: [helm-common] Override the name.
- <a id="definitions/fullnameOverride"></a>**`fullnameOverride`** _(string)_: [helm-common] Override the fullname.
- <a id="definitions/releaseTrunc"></a>**`releaseTrunc`** _(integer)_: [helm-common] The release trunk length. Default: `20`.
- <a id="definitions/prefixTrunc"></a>**`prefixTrunc`** _(integer)_: [helm-common] The prefix trunk length (release anf chart name). Default: `40`.
- <a id="definitions/serviceName"></a>**`serviceName`** _(string)_: [helm-common] The name of the service (not Kubernetes service), this will postfix the name.
- <a id="definitions/labels"></a>**`labels`** _(object)_: [helm-common] Pod labels. Can contain additional properties.
  - **Additional Properties** _(string)_
- <a id="definitions/annotations"></a>**`annotations`** _(object)_: [helm-common] Pod annotations. Can contain additional properties.
  - **Additional Properties** _(string)_
