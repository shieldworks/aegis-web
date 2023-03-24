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

## Prerequisites

Other than the source code, you need the following set up for your development
environment to be able to locally develop **Aegis**:

* [Docker][docker] installed and running for the local user.
* [Minikube][minikube] installed on your system.
* [Make][make] installed on your system.
* [Git][git] installed on your system.

[minikube]: https://minikube.sigs.k8s.io/docs/
[make]: https://www.gnu.org/software/make/
[git]: https://git-scm.com/

> **Can I Use Something Other than Minikube and Docker**?
>
> Of course, you can use any Kubernetes cluster to develop, deploy, and test
> **Aegis**.
>
> Similarly, you can use any OCI-compliant container runtime. It does not
> have to be Docker.
>
> We are giving **Minikube** and **Docker** as an example because they are
> easier to set up; and when you stumble upon, it is easy to find supporting
> documentation about these to help you out.

## Cloning Aegis

Create a workspace folder and clone **Aegis** into it.

```bash 
mkdir $HOME/Desktop/WORKSPACE
cd $HOME/Desktop/WORKSPACE
git clone "https://github.com/shieldworks/aegis.git"
cd aegis
```

> **Want to Create a Pull Request**?
>
> If you are contributing to the source code, make sure you read
> [the contributing guidelines][contributing], and [the code of conduct][coc].

[fork]: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/about-forks
[contributing]: https://github.com/shieldworks/aegis/blob/main/CONTRIBUTING.md
[coc]: https://github.com/shieldworks/aegis/blob/main/CODE_OF_CONDUCT.md

## Getting Help

Running `make help` at the project root will provide you with a list of
logically grouped commands:

```text0
# aegis (main) $ make help
                         ---------------------------------------------------
                         eval (minikube -p minikube docker-env)
            Docker Host: 
Minikube Active dockerd: 
                         ---------------------------------------------------
                   PREP: make k8s-delete;make k8s-start;
                   TEST: make build-local;make deploy-local;make test-local;
 TEST (docker/aegishub): make build;make deploy;make test
                RELEASE: make bump;make build;make tag
                         ---------------------------------------------------
      EXAMPLE (SIDECAR): make example-sidecar-deploy-local |
                         make example-sidecar-deploy
                         ---------------------------------------------------
          EXAMPLE (SDK): make example-sdk-deploy-local |
                         make example-sdk-deploy
                         ---------------------------------------------------
       EXAMPLE (INIT C): make example-init-container-deploy-local |
                         make example-init-container-deploy
                         ---------------------------------------------------
                CLEANUP: make clean
                         ---------------------------------------------------

```

Note that depending on the version of **Aegis** you use, what you see can
be slightly different.

Now let’s explain some of these steps (*and for the remainder, you can read
the `Makefile` at the project root):

* `make k8s-delete`: Deletes your minikube cluster.
* `make k8s-start`: Starts an existing cluster, or creates a brand new one.
* `make build-local`: Builds all the projects locally and pushes them to
  the local container registry.
* `make deploy-local`: Deploys **Aegis** locally with the artifacts generated
  at the `build-local` step.
* `make test-local`: Runs integration tests to make sure that the changes
  that were made doesn’t break anything.

If you run these commands in the above order, you’ll be able to **build**,
**deploy**, and **test** your work locally.

[docker]: https://www.docker.com/

## Minikube Quirks

If you are using **Ubuntu**, it would be helpful to know that **Minikube** and
**snap** version of **Docker** do not play well together. If you are having
registry-related issues, or if you are not able to execute a `docker images`
without being the root user, then one resolution can be to remove the snap
version of docker and install it from the source:

```bash 
{% raw %}sudo apt update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \ 
    sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io{% endraw %}
```

> **Restart Your System**
>
> After doing this, you might need to restart your system and execute
> `minikube delete` on your terminal too. Although you might feel that this
> step is optional, it is **not**; trust me 🙂.

After installing a non-snap version of **Docker** and restarting your system, if
you can use **Minikube** *Docker registry*, then, perfect. If not, there are
a few things that you might want to try. So if you are still having issues
keep on reading.

Before trying anything else, it might be worth giving [Docker Post Installation
Steps][post-installation] from the official Docker website a shot. Following
that guideline **may** solve Docker-related permission issues that you might
still be having.

> **Restart, Maybe?**
>
> If you still have permission issues after following the official Docker post
> installation steps outlined above, try **restarting** your computer once more.
>
> Especially when it comes to Docker permissions, restarting can help,
> and worst case it’s still worth giving a try.

[post-installation]: https://docs.docker.com/engine/install/linux-postinstall/

Still no luck? Keep on reading.

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

[makefile]: https://github.com/shieldworks/aegis/blob/main/Makefile

<!--
Added
Changed
Deprecated
Removed
Security
-->
