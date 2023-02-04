---
#
# .-'_.---._'-.
# ||####|(__)||   Protect your secrets, protect your business.
#   \\()|##//       Secure your sensitive data with Aegis.
#    \\ |#//                  <aegis.z2h.dev>
#     .\_/.
#

layout: default
keywords: Aegis, installation, deployment, faq, quickstart
title: Using Aegis Go SDK
description: directly consume the <strong>Aegis Safe</strong> API
micro_nav: true
page_nav:
  prev:
    content: local development
    url: '/docs/contributing'
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

[Check out the relevant sections of the **Registering Secrets** article][registering-secrets]
for an example of [**Aegis Go SDK**][go-sdk] usage.

[registering-secrets]: /docs/register

<p>&nbsp;</p>

----

<p>&nbsp;</p>

## **Aegis Safe** REST API

The **Aegis Go SDK** is, at a high level, and abstraction over **Aegis Safe** 
REST API.

That said, knowing the internals of **Aegis Safe** API can be helpful in case
you want to develop your own SDK in your programming language of choice.

### `POST /v1/fetch`

`/v1/fetch` can only be called from the **workloads**.


```bash 
# The workload is is inferred from the workload’s TLS certificate.

http POST $aegisSafeHost/v1/fetch 

{
  "data": "content of the secret",
  "created": "2022-12-12 00:00",
  "updated": "2023-01-01 00:00",
}
```

### `POST /v1/secret`

`/v1/secret` can only be called from **Aegis Sentinel**.

```bash
# The workload is is inferred from the workload’s TLS certificate.

http POST $aegisSafeHost/v1/secret
   key="demo-workload" # the ID of the workload.
   value="contents of the secret"
   
OK
```