---
#
# .-'_.---._'-.
# ||####|(__)||   Protect your secrets, protect your business.
#   \\()|##//       Secure your sensitive data with Aegis.
#    \\ |#//                  <aegis.z2h.dev>
#     .\_/.
#

layout: default
keywords: Aegis, release, maintenance
title: Releasing a New Version
description: guidelines to maintain, sign, and publish code
micro_nav: true
page_nav:
  prev:
    content: Miscellaneous
    url: '/misc'
---

## Cutting a Release

Before every release cut, follow the steps outlined below.

### 1. Double Check

Ensure all changes that need to go to a release in all
repositories have been merged to `main`.

### 2. Fetch Assets

```bash
# Uninstall Aegis:
make clean
# Pull recent code:
make pull
# Copy over recent manifests:
make sync
```

### 3. Bump Versions

First, double check all required `Makefile`s and `Deployment.yaml`s have
the same version.

Then edit `./hack/bump-version.sh` to move everything to the new version.

Then execute the following:

```bash
make bump
make sync
```

### 4. Build and Deploy Locally

Before running the following commands, make sure you haven an **insecure**
docker registry running at `localhost:5000`.

For minikube, `minikube addons enable registry` should work.

```bash
make build-local
make deploy-local
```

### 5. Run Integration Tests

```bash
make test-local
```

Ensure that the program succeeds.
It can take several minutes to complete.

### 6. Push the Updated Code

At least, there are new version numbers in the manifests.
They need to be pushed before tagging a release:

```bash
make commit
```

### 7. Tag a New Release

```bash
make build
make tag
```

### 8. All Set 🎉

You’re all set.

Happy releasing.