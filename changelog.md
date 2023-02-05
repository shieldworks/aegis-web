---
#
# .-'_.---._'-.
# ||####|(__)||   Protect your secrets, protect your business.
#   \\()|##//       Secure your sensitive data with Aegis.
#    \\ |#//                  <aegis.z2h.dev>
#     .\_/.
#

layout: default
keywords: Aegis, Changelog
title: Aegis Changelog
description: what happened so far
micro_nav: true
page_nav:
  prev:
    content: Miscellaneous
    url: '/misc'
---

> **Cutting A Release**
>
> If you are a maintainer responsible for release cuts,
> see the [**release instructions for maintainers**](/release).

# Aegis Changelog

## [v0.12.30] - 2023-02-05

## Added

* Added contributing guidelines.
* Added local development instructions.
* Added default values to sample `yaml` manifests.
* Added the ability to list secrets to Aegis Sentinel.
* Other documentation updates.

## Changed

* Improvements to local development workflow.
* **BREAKING**: Changes in Aegis Safe REST API that required changes in
  demo workload implementations, and Aegis Sentinel.

## [v0.11.20] - 2023-02-03

### Added

* Added a [media kit ](/media).
* Added more configuration options through environment variables.

### Changed

* Aegis Sidecar now exponentially backs off if it cannot fetch secrets
  in a timely manner.
* **BREAKING**: All time units in environment variables 
  are now milliseconds, instead of seconds.

## [v0.11.5] - 2023-02-01

### Added

* Improved the website’s information architecture.
* Added audit logs to Safe API methods.
* When a secret persist error occurs, it is logged.
* Improvements in development workflow (*enabling local registries*)

### Changed

* Retry persisting secrets to disk one more time before erring out.
* Added a channel mechanism to funnel disk errors instead of suppressing them.

## [v1.11.0] - 2023-01-28

### Current State

As per this release, Aegis is able to securely dispatch secrets to workloads
within a single cluster; it encrypts and backs up secrets to a volume; and
if it crashes, it recovers its state from the backups. The code is stable
enough and the solution can be used at a production capacity.

That’s also why we started a changelog: Before this point in time, it
was a figurative cambrian soup, and it was too chaotic to even keep a changelog.

From this point on, we will record the changes, deprecations,
removals, fixes, and security patches more carefully.

### Added

* Added a script to do functional test before every release cut.
* Whenever a secret is saved, the old secret is backed up.
* Ability to delete secrets.
* In-memory mode: Secrets can optionally NOT be persisted on disk and kept
  only in memory. This is not the default behavior and needs to be set
  using an environment variable.

### Changed

* Usability improvements to the website.
* Added more tutorials and articles to the website to explain how Aegis works.
* Aegis Safe responds with RFC3339 instead of RubyDate. RFC3339 is also what Go
  uses when serializing dates into JSON.
* Added a buffered channel to save secrets on disk to improve performance
  especially for slower disks.
* Better logs.

<!--
Added
Changed
Deprecated
Removed
Security
-->