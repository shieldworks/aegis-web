---
#
# .-'_.---._'-.
# ||####|(__)||   Protect your secrets, protect your business.
#   \\()|##//       Secure your sensitive data with Aegis.
#    \\ |#//                    <aegis.ist>
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

<p style="text-align:right;position:relative;top:-40px;"
><a href="https://github.com/ShieldWorks/aegis-web/blob/main/changelog.md"
 style="border-bottom: none;background:#e0e0e0;padding:0.5em;display:inline-block;
border-radius:8px;">
edit this page on <strong>GitHub</strong> ✏️</a></p>

# Aegis Changelog

## Recent

* The docs now have “*last update*” timestamp and a commit hash too.
* Other documentation updates.

## [v0.16.1] - 2023-05-16

### Fixed

* There were inconsistencies in the documentation due to recent changes that
  need an update. The docs are more consistent now.
* Minor bug fixes.
* Fixes in the Kustomization files to remove deprecation warnings.

### Changed

* Documentation overhaul: Added an index page, modified the video player on
  the home page to make it easier to watch, added more use cases.
* Minor bug fixes.
* Upgraded SPIRE to v1.6.3; SPIFFE CSI Driver to v0.2.3; CSI Node Driver
  Registrar to v2.7.0
* The sample workload name use the examples has been changed from `example`
  to just `example`. This makes it clear that the workload is just an example,
  and it is ot related to `aegis-system` at all. It is not the platform,
  it is the consumer.
* Changes in the build scripts and the `Makefile`.
* **BREAKING**: The `none` type is removed from the Aegis Sentinel formatting
  option; the default format is `json` now.
* **BREAKING**: Changed container repository names to `aegishub/aegis-ist-*`
  and `aegishub/example-*`. This was due to a root signing key being lost
  and us being unable to sign upcoming images. Nonetheless, the change
  allowed us some cleanup and restructuring too.

## [v0.15.8] - 2023-04-21

This was a maintenance release that includes a few important hotfixes.

### Fixed

* Aegis Safe queues were not cleaning due to a bootstrapping bug. Fixed that.
* Aegis Safe was crashing when deleting a secret that does not exist. Fixed that.
* Template transformation bugs for certain kinds of input data. Right now 
  template transformation works for any `map[string]any`.

## [v0.15.7] - 2023-04-19

This was a prerelease to test the “multiple secrets” feature and create a 
demo workload that can be utilized in certain CI/CD scenarios. There will be a 
follow-up minor release to clean up some of the dust and make the documentation
aligned with the current state of the source code.

Here is a list of changes:

### Added

* Aegis Sentinel can now encrypt values. You can then use those encrypted
  values instead of plain text value to store as secrets for an added 
  layer of security.
* Documentation updates in the source code to make contributions easier,
  and the code easier to understand.
* All logs require a `correlationId` to make it easier to track the
  requests and responses.
* Added a new use case to demonstrate the ability to add multiple secrets.

### Changed

* Aegis now supports associating multiple secrets with a workload. This is
  useful especially when you have many secrets for the workload, and you
  want to encrypt them in chunks. This is done with the append (`-a`) flag.
* **BREAKING**: Log levels have changes. Now the lowest level is `0` (OFF) and
  the highest level is `7` (TRACE).
* **BREAKING**: Made the secret deletion more explicit with the `-d` flag.
* **BREAKING**: Removed the ability to change log levels dynamically. Piggybacking
  on the secret payload was a hacky solution. We will implement a more robust
  solution in the future.

## [v0.15.6] - 2023-03-30

### Added

* Added an error logs when Aegis Safe secrets queue overflows. That is
  useful to create alarms, as it is an important metric of Aegis Safe’s
  performance.
* Simplified the development and publishing flows.
* Added links to the documentation pages to make them editable on GitHub.

### Changed

* Stability improvements.
* Moved all Aegis projects under a single (mono)repo for ease of maintenance.
  This way, all the examples and documentation can remain under the same repo;
  eliminating the need to jump between several codebases. Plus, it makes 
  static analysis, coverage reporting, vulnerability scanning, detecting 
  unused functions, repetitive code blocks, etc, etc. so much easier: 
  All good things.
* Design changes on the website to make it more eye-friendly. Improvements
  to the readability of the documentation.
* **BREAKING**: Removed `"cluster"` as a backing store option. It does not
  make sense to back up secrets onto etcd. It makes the architecture 
  complicated, impacts the security posture without providing much added value.

## [v0.14.0] - 2023-03-18

### Added

* Upgraded Aegis to use `SPIRE v1.6.1`.
* Aegis now has versioned documentation: We will take a snapshot of the
  documentation at every important release.
* Significant documentation updates.

### Changed

* Updated the build scripts to be less error-prone.
* The namespace of Kubernetes `Secret`s created by Aegis Sentinel now default to
  `"default"` (*instead of `"aegis-system"`).
* Moved the audit logging functionality to `aegis-core` to make it reusable
  between all Aegis modules.
* Moved **Aegis** repositories to a GitHub organization (ShieldWorks) for
  ease of management: <https://github.com/shieldworks>.
* **BREAKING**: Removed the insecure random string generator methods from the
  core API. Now, there is only one `RandomString()` method that generates
  a cryptographically secure and unique random string.
* **BREAKING**: The versioned copies of the secrets on the drive are suffixed
  with `.backup` to grep them easily. The older items (that are not suffixed)
  will be caught by the `List` API as new key/value pairs, resulting in
  extra entries that are not being used.

## [v0.13.0] - 2023-03-03

### Added

* Aegis has a new website: [aegis.ist](https://aegis.ist/).
* Added a documentation page for Aegis Sentinel CLI usage.
* Template transformations now apply to the secret values that are
  reflected to the workloads as well.

### Fixed

* Fixed minor errors in documentation.
* Minor bug fixes.

### Changed

* **BREAKING**: Trust root of entities changed from `z2h.dev` to `aegist.ist`.
* Updated to Aegis Sentinel commands.
* Documentation updates to talk about how to use Aegis Sidecar to propagate 
  Aegis-Safe-managed secrets into Kubernetes.
* Documentation update: Changed contact, support, and security feedback emails
  to official `@aegis.ist` emails.

## [v0.12.70] - 2023-02-17

### Added

* Ability to wait for the secret to initialize first, using Aegis Init Container.
* Ability to use go templates to transform secrets. In this version, the 
  transformation only applies to the generated Kubernetes `Secret`s. In the
  upcoming versions, Aegis Safe API will also honor the transformations when
  returning the secret values.

### Changed

* Upgraded all builder images to Go `v1.20.1`.

### Fixed

* Fixed a channel overflow bug that was blocking secret operations when an
  error occurs.

## [v0.12.55] - 2023-02-15

### Added

* Added ability to use actual Kubernetes `Secret` object to save the values
  of the registered secrets—this is (*mostly*) for legacy support.
* Added an option to use the cluster as a backing store (*work in progress*)
* Implemented additional configuration options through environment variables
* Created a script to list the status of all Aegis projects (*especially
  useful when doing deployments and release cuts*)

### Changed

* There are breaking changes in certain environment variable names. The 
  documentation ha been updated to reflect these changes.

## [v0.12.30] - 2023-02-05

### Added

* Added contributing guidelines.
* Added local development instructions.
* Added default values to sample `yaml` manifests.
* Added the ability to list secrets to Aegis Sentinel.
* Other documentation updates.

### Changed

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