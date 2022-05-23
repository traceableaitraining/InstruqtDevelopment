---
slug: installing-a-tracing-agent
id: o05ckzit4sna
type: challenge
title: Installing a Tracing agent
teaser: This lesson will walk you through how to install a "Tracing agent" specifically
  our Sidecar Proxy!
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
- title: Juice Shop
  type: service
  hostname: workstation
  port: 3000
difficulty: basic
timelimit: 7200
---
So now that we understand that the Platform agent will be receiving spans/traces from a Tracing agent we'll need to install one into your environment to see them in our UI. In a k8s environment we make this super easy! Apply the following labels and annotation:

```bash
kubectl label ns default traceableai-inject-proxy=enabled
```
With those set we're ready to now restart the deployment so that the sidecar proxy can attach to your pods and we'll be set for instrumentation.

```bash
kubectl rollout restart deployment my-juice-shop
```
Now to verify the sidecar proxy was succesffully injected run the following command
```bash
kubectl get -w pods
```
and you should see output similar to the following - Note the 2/2 running pods

<code>
NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;READY&nbsp;&nbsp;&nbsp;STATUS&nbsp;&nbsp;&nbsp;&nbsp;RESTARTS&nbsp;&nbsp;&nbsp;AGE\n
my-juice-shop-69984cdcdf-zr5zk   2/2     RUNNING   0          2s
</code>
