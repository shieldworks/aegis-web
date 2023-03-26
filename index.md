---
#
# .-'_.---._'-.
# ||####|(__)||   Protect your secrets, protect your business.
#   \\()|##//       Secure your sensitive data with Aegis.
#    \\ |#//                    <aegis.ist>
#     .\_/.
#

layout: homepage
keywords: aegis, secrets management, secrets store, Kubernetes

title: Aegis
description: keep your secrets… secret
buttons:
- icon: arrow-right
  content: Quickstart
  url: '/docs'
  external_url: false
- icon: github
  content:  Source Code
  url: 'https://github.com/shieldworks/aegis'
  external_url: true
- icon: slack
  content:  Community
  url: '/contact#community'
  external_url: false

grid_navigation:
- title: <strong>Aegis</strong> Quickstart
  excerpt: Get your hands dirty. Install and use Aegis on your Kubernetes cluster.
  cta: get started
  url: '/docs'
- title: Production Tips
  excerpt: Production deployment recommendations to let your ops teams <code>#sleepmore</code>.
  cta: prepare your clusters
  url: '/production'
- title: Using <strong>Aegis</strong> SDK
  excerpt: Use <strong>Aegis Go SDK</strong> for a tighter integration with <strong>Aegis</strong> components.
  cta: dive in; water is warm
  url: '/docs/sdk'
- title: Keeping Secrets
  excerpt: A tutorial on how to dispatch secrets to workloads.
  cta: get your hands dirty
  url: '/docs/register'
- title: <strong>Aegis</strong> Community
  excerpt: Join us on <strong>Slack</strong>. It’s nice and cozy in here.
  cta: welcome to the jungle
  url: '/contact#community'
- title: Coming Up Next…
  excerpt: What we are planning to do in the near (<em>and far</em>) future.
  cta: see what’s cooking
  url: '/timeline'
 
---

<div style="margin-top:0.75em"></div>

**Aegis** is a **Kubernetes-native**, lightweight **Secrets Manager**.

With **Aegis**, your sensitive data is always secure and protected.

**Aegis** keeps your secrets… secret.

<div style='padding:56.25% 0 0 0;position:relative;'>
  <iframe src='https://vimeo.com/showcase/10074951/embed' 
    allowfullscreen frameborder='0' 
    style='position:absolute;top:0;left:0;width:100%;height:100%;'></iframe>
</div>

<div style="background:#FFF4D5;color:#1D1600;padding:1em;margin:3em 1em;
box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;border-radius:2px;

">
<p><strong>Imagine this</strong>: An entire environment with <strong>ZERO</strong> 
service keys, usernames, passwords, tokens, or credentials.</p>

<p>☝️ That would mean there will be no need for credential rotation, 
no possibility fo secrets leaking into logs, or heaven forbid git repos because 
<strong>there are no secrets</strong>.</p>

<p>With <strong>Aegis</strong> that’s exactly what you get.</p>

<p><span style="background:#EDC910;display:inline-block;padding:0.5em;"><strong>Aegis</strong> makes this possible 
by leveraging battle-tested and proven technologies including 
<a href="https://spiffe.io" style="color:#000000;border-bottom: 4px #000000 solid;">SPIFFE/SPIRE</a> and 
<a href="https://age-encryption.org/" style="color:#000000; border-bottom:4px #000000 solid;">Age Encryption</a>.</span></p>

<p>When a Pod requests a secret, <strong>Aegis</strong> provides a 
<strong>short-lived</strong> X.509 certificate to confirm its identity. This 
certificate is <strong>unique to each Pod</strong> and ensures secure access to 
the assigned resource.</p>

<p>The certificate is frequently rotated, limiting damage in the 
extremely unlikely event of a compromise, as it only grants access to a 
specific secret for a very brief time.</p>

<p>In addition, when the Pod is down or deleted, the certificate is useless because
no other Pod can use it.</p>

<p><span style="background:#EDC910;display:inline-block;padding:0.5em;">There are 
no service keys, no usernames, no passwords, no tokens, no SSH keys, no API 
keys…, no nothing.</span></p>

<p>It’s like <strong>magic</strong>.</p>

<p>It 👏 Is 👏 <strong>Aegis</strong>.</p>
</div>

[spiffe]: https://spiffe.io/
[age]: https://age-encryption.org/

[contact]: /contact
[contribute]: /contributing
[coffee]: /coffee
[slack-invite]: https://join.slack.com/t/aegis-6n41813/shared_invite/zt-1myzqdi6t-jTvuRd1zDLbHX0gN8VkCqg "Join aegis.slack.com"
