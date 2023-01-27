---
layout: default
keywords: Aegis, release, maintenance
title: Releasing a New Version
description: guidelines to maintain, sign, and publish code
micro_nav: true
page_nav:
  prev:
    content: what’s coming up
    url: '/docs/timeline'
  next:
    content: the <strong>Aegis</strong> community
    url: '/contact'
---

> ⚠️ **This Section Is for Maintainers**
> 
> This is a brief guideline for **Aegis** maintainers.
> 
> This section describes release related operations.
> 
> If you are not a maintainer, feel free to skip this section.

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

```bash 
make build
make deploy
```

### 5. Test the Demo Workload (*With Sidecar*)

Then execute the following:

```bash 
make demo-sidecar
```

Ensure that you can save a secret.

### 6. Test the Demo (*Using SDK*)

Then execute the following:

```bash 
make demo-sdk
```

Ensure that you can save a secret.

### 7. All Tests Shall Pass

If anything fails, rinse and repeat.

### 8. Push the Updated Code

At least, there are new version numbers in the manifests.
They need to be pushed before tagging a release:

```bash
make commit
```

### 9. Tag a New Release

```bash
make tag
```

### 10. All Set 🎉

You’re all set.

Happy releasing.