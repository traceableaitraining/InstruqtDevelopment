---
slug: contain
id: cqed4qywepbn
type: challenge
title: Contain
teaser: This track will walk you through how to contain an existing attack
notes:
- type: text
  contents: |-
    # Nerd Trivia

    The original codename for Kubernetes was "Project 7", a reference to the _Star Trek_ ex-Borg character [Seven of Nine](https://en.wikipedia.org/wiki/Seven_of_Nine). Since K8s was based on Google's internal container engine, "The Borg", it seemed like an appropriate choice.

    Now you know why the Kubernetes wheel has seven spokes!
difficulty: basic
timelimit: 7200
---

# Block Malicious User
1. Paste this URL into your browser and add your environment to the end: https://app.traceable.ai/attackers/active?time=1d&env=
2. Click the three ellipsis on the right and then select "Deny". This will create an ACL for the user which returns a 403 the next time they try to do anything with JuiceShop