---
slug: attackstwo
id: mdqjmzaao2et
type: challenge
title: Attack Campaign 2
teaser: Nice try baddie!
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
difficulty: basic
timelimit: 7200
---

# Rerun the attacks
```bash
newman run juiceshopattacks.json -e vars.json
```
