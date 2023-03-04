---
#
# .-'_.---._'-.
# ||####|(__)||   Protect your secrets, protect your business.
#   \\()|##//       Secure your sensitive data with Aegis.
#    \\ |#//                    <aegis.ist>
#     .\_/.
#

layout: default
keywords: Aegis, release, maintenance, development
title: Local Development
description: how to develop <strong>Aegis</strong> locally
micro_nav: true
page_nav:
  prev:
    content: registering secrets
    url: '/docs/register'
  next:
    content: using <strong>Aegis</strong> go SDK
    url: '/docs/sdk'
---

## Introduction

This section contains instructions to test and develop **Aegis** locally.

## Cloning Aegis Repositories

Create a workspace folder and clone **Aegis** into it.

After you clone `aegis`, pull its sister repositories too by executing
`./hack/pull.sh`

```bash 
mkdir $HOME/Desktop/WORKSPACE
cd $HOME/Desktop/WORKSPACE
git clone "https://github.com/zerotohero-dev/aegis.git"
cd aegis
./hack/pull.sh
```

Now you should see these folders in your workspace:

```bash
cd $HOME/Desktop/WORKSPACE
ls -al
aegis
aegis-core
aegis-safe
aegis-sdk-go
aegis-sentinel
aegis-sidecar
aegis-spire
aegis-web
aegis-workload-demo-using-sdk
aegis-workload-demo-using-sidecar
```

> **Creating a Pull Request**?
> 
> If you want to create a pull request you can replace the repositories
> that you are working on [with your forked repo][fork]. The rest of the
> workflow here should still work similarly.
> 
> If you are contributing to the source code, make sure you read
> [the contributing guidelines][contributing], and [the code of conduct][coc].

[fork]: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/about-forks
[contributing]: https://github.com/zerotohero-dev/aegis/blob/main/CONTRIBUTING.md
[coc]: https://github.com/zerotohero-dev/aegis/blob/main/CODE_OF_CONDUCT.md

## Prerequisites

Other than the source code, you need the following set up for your development
environment to be able to locally develop **Aegis**:

* [Docker][docker] installed and running for the local user.
* [Minikube][minikube] installed on your system.
* [Make][make] installed on your system.

[minikube]: https://minikube.sigs.k8s.io/docs/
[make]: https://www.gnu.org/software/make/

> **Can I Use Something Other than Minikube and Docker**?
> 
> Of course you can use any Kubernetes cluster to develop, deploy, and test
> **Aegis**. 
> 
> Similarly, you can use any OCI-compliant container runtime. It does not
> have to be Docker.
>
> We are giving **Minikube** and **Docker** as an example because they are
> easier to set up; and when you stumble upon, it is easy to find supporting
> documentation about these to help you out. 
> 
> Additionally, it would be hard to keep the documentation updated for all 
> possible distros, clusters, and container runtimes.
> 
> Which means, for now at least, if you are not using **Minikube**, you are
> on you own 🙂.

## Preparing Your Environment

The best way to test and develop **Aegis** right now is to use a **Minikube**
environment.

Make sure you have [Docker][docker] up and running. And then execute
the following.

```bash
cd $WORKSPACE/aegis
./hack/minikube-start.sh
```

[docker]: https://www.docker.com/

## Deploying Your Code to the Cluster

After you make your changes, you can run the following to build and deploy
the latest and the greatest:

```bash
cd $WORKSPACE/aegis

make sync
make build-local
make deploy-local
```

The [Makefile][makefile] contains other useful targets that you might want
to explore too.

For example, if you just want to build and deploy **Aegis Sidecar**, you 
can do:

```bash
cd $WORKSPACE/aegis

make build-sidecar-local
```

Or if you want to pull recent Kubernetes manifests, you can run:

```bash
cd $WORKSPACE/aegis

make sync
```

## Minikube Quirks

Depending on your operating system, and the Minikube version that you use
it might take a while to find a way to push images to Minikube’s internal
Docker registry. [The relevant section about the Minikube handbook][minikube-push]
covers a lot of details, and can be helpful; however, it is also really easy 
skip or overlook certain steps.

If you have `docker push` issues, or you have problem your Kubernetes Pods 
acquiring images from the local registry, try these:

* Execute `eval $(minikube docker-env)` before pushing things to **Docker**. This
  is one of the first instructions [on the “*push*” section of the Minikube
  handbook][minikube-push], yet it is still very easy to inadvertently skip it.
* Make sure you have the registry addon enabled (`minikube addons list`).
* You might have luck directly pushing the image: 
  `docker build --tag $(minikube ip):5000/test-img`; followed by:
  `docker push $(minikube ip):5000/test-img`.
* There are also `minikube image load` and `minikube image build` commands
  that might be helpful.

[minikube-push]: https://minikube.sigs.k8s.io/docs/handbook/pushing/

## Enjoy 🎉

Just explore the [Makefile][makefile] and get a feeling of it.

[Feel free to touch base](/contact#community) if you have any questions, comments,
recommendations.

[makefile]: https://github.com/zerotohero-dev/aegis/blob/main/Makefile
