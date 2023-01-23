---
layout: default
keywords: Aegis, installation, deployment, faq, quickstart
title: Quickstart
description: get your hands dirty
micro_nav: true
page_nav:
  prev:
    content: back to home 
    url: '/'
  next:
    content: registering secrets
    url: '/docs/register'
---

## What Is **Aegis**?

[**Aegis**][aegis] is a **Kubernetes-native**, lightweight secrets manager 
that keeps your secrets secret. With **Aegis**, you can rest assured 
that your sensitive data is always **secure** and **protected**. 

Aegis is perfect for securely storing arbitrary configuration information at a 
central location and securely dispatching it to workloads.

By leveraging Kubernetes security primitives, [SPIRE][spire], and strong,
industry-standard encryption, **Aegis** ensures that your secrets are **only** 
accessible to **trusted** and **authorized** workloads. **Aegis**’s 
Cloud Native—secure by default—foundation helps you safeguard your business 
and protect against data breaches.

[Check out **Aegis**’s *GitHub* for details][aegis-github].

[aegis]: https://github.com/zerotohero-dev/aegis
[spire]: https://spiffe.io/
[aegis-github]: https://github.com/zerotohero-dev/aegis

## See **Aegis** in Action

If you haven’t watched this introductory video yet, now might be a good time 🙂.

[![Watch the video](/doks-theme/assets/images/capture.png)](https://vimeo.com/v0lkan/secrets)

## Where **NOT** to Use Aegis

Aegis is **not** a Database, nor is it a distributed caching layer. Of course,
you may tweak it to act like one if you try hard enough, yet, that is
generally not a good use of the tool.

Aegis is suitable for storing secrets and dispatching them; however, it
is a *terrible* idea to use it as a centralized database to store everything
but the kitchen sink.

Use **Aegis** to store service keys, database credentials, access tokens,
etc.


## How Do I Get the Root Token? Where Do I Store It?

Unlike some other secret vaults, you do not need an admin token
to operate **Aegis** 🙂.

Benefits of this approach is: It helps the Ops team `#sleepmore`, since
everything is automated, and you won’t have to manually unlock **Aegis** upon
a system crash, for example.

However, there’s no free lunch, and as the operator of a production system,
your homework is to secure access to your cluster. [Check out the **Production 
Deployment Guidelines**][production] for further instructions about hardening your 
cluster to securely use **Aegis**.

[production]: /docs/production

## Installation

First, ensure that you have sufficient administrative rights on your 
**Kubernetes** cluster. Then create a workspace folder and clone the project.
And finally execute the `./hack/install.sh` as follows.

```bash 
mkdir $HOME/Desktop/WORKSPACE
export $WORKSPACE=$HOME/Desktop/WORKSPACE

cd $WORKSPACE

git clone https://github.com/zerotohero-dev/aegis
cd aegis

./hack/install.sh
```

Additionally, you can deploy a demo workload to experiment:

```bash 
# Demo workload that uses `aegis-sidecar` 
./hack/install-workload-using-sidecar.sh

# Demo workload that directly talks to `aegis-safe` 
# using Aegis Go SDK
./hack/install-workload-using-sdk.sh
```

To verify installation check out the `aegis-system` namespace:

```bash
kubectl get deployment -n aegis-system

# Output:
#
# NAME             READY   UP-TO-DATE   AVAILABLE
# aegis-safe       1/1     1            1
# aegis-sentinel   1/1     1            1
```

That’s it. You are all set 🤘.

## Uninstalling Aegis

Uninstallation can be done by running a script:

```bash 
cd $WORKSPACE/aegis 
./hack/uninstall.sh
```

## Next Steps

Since you have **Aegis** up and running, here is a list of topics that you can 
explore next:

* [How to Register Secrets to A Workload Using **Aegis**](/docs/register)
* [How to Use **Aegis** Go SDK](/docs/tutorial)
* [A Deeper Dive into **Aegis** Architecture](/docs/architecture)
* [**Aegis** Production Deployment Guidelines](/docs/production)
* [**Aegis** Design Decisions](/docs/system-design)
* [Core Technologies **Aegis** Leverages](/docs/technologies)

In addition, these topics might pique your interest too:

* [Umm… How Do I Pronounce “**Aegis**”](/docs/pronounciation)?
* [Who’s Behind **Aegis**](/docs/maintainers)?
* [What’s Coming Up Next](/docs/timeline)?

If you have comments, suggestions, and ideas to share; or if you have found
a bug; or if you want to contribute to **Aegis**, these links might be what
you are looking for:

* [I Want to Contribute to **Aegis**](/contact#i-want-to-be-a-contributor)
* [I Have Something to Say](/contact#comments-and-suggestions)
* [Can I Buy You A Coffee](/contact#coffee)?

## Thanks ❤️

Hope you enjoy using **Aegis** as much as we do and find it helpful 
in making your ops teams `#sleepmore`. May the source be with you 🦄.
