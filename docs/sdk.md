---
layout: default
keywords: Aegis, installation, deployment, faq, quickstart
title: Using Aegis Go SDK
description: directly consume the <strong>Aegis Safe</strong> API
micro_nav: true
page_nav:
  prev:
    content: registering secrets
    url: '/docs/register'
  next:
    content: <strong>Aegis</strong> deep dive
    url: '/docs/architecture'
---

This is the documentation for [Aegis Go SDK][go-sdk].

[go-sdk]: https://github.com/zerotohero-dev/aegis-sdk-go


## Package `sentry`

The current SDK has two public methods under the package `sentry`:

* `func Fetch`
* `func Watch`

### `func Fetch() (string, error)`

`Fetch` fetches the up-to-date secret that has been registered to the workload.

```go
secret, err := sentry.Fetch()
```

In case of a problem, `Fetch` will return an empty string and an error 
explaining what went wrong.


### `func Watch()`

`Watch` synchronizes the internal state of the workload by talking to 
[**Aegis Safe**][aegis-safe] regularly. It periodically calls `Fetch()` 
behind the scenes to get its work done. Once it fetches the secrets, 
it saves them to the location defined in the `AEGIS_SIDECAR_SECRETS_PATH` 
environment variable (*`/opt/aegis/secrets.json` by default*).

[aegis-safe]: https://github.com/zerotohero-dev/aegis-safe

## Examples

[Check out the relevant section of the **Registering Secrets** article][registering-secrets]
for an example of [**Aegis Go SDK**][go-sdk] usage.

[registering-secrets]: /docs/register
