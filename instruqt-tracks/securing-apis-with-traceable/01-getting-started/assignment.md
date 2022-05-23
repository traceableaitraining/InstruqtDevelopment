---
slug: getting-started
id: ztwiq5r9gdmm
type: challenge
title: Getting Started
teaser: This lesson provides a working understanding of the environment that'll be
  used to conduct the rest of the lessons in this workshop.
notes:
- type: text
  contents: |-
    # Nerd Trivia

    The original codename for Kubernetes was "Project 7", a reference to the _Star Trek_ ex-Borg character [Seven of Nine](https://en.wikipedia.org/wiki/Seven_of_Nine). Since K8s was based on Google's internal container engine, "The Borg", it seemed like an appropriate choice.

    Now you know why the Kubernetes wheel has seven spokes!
tabs:
- title: Workstation
  type: terminal
  hostname: workstation
- title: Google Project
  type: service
  hostname: cloud-client
  port: 80
- title: Juice Shop
  type: service
  hostname: workstation
  port: 3000
difficulty: basic
timelimit: 7200
---
We've spun up a GKE cluster and installed our Traceable Platform agent and addtionally deployed the OWASP JuiceShop application - commonly used as a benchmark for Application Security tools. Go ahead and run some commands to explore the environment.

```bash
kubectl get pods
```
The Traceable Platform agent will install into it's own namespace by default to see it when running your ```kubectl``` commands you'll need to append ```-n traceableai``` to them like so
```bash
kubectl get pods -n traceableai
```
