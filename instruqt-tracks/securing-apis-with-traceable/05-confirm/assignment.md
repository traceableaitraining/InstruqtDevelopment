---
slug: confirm
id: xydqjzl2zitn
type: challenge
title: Confirm
teaser: This track with walk you through the process of confirming attacks.
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

# Confirm Attackers

1. Paste this URL in your browser. Add your environment at the end: https://app.traceable.ai/attackers/active?time=1d&env=
2. Sign in with the credentials provided to you
3. Note we are grouping all the events under the attackers activity log. This reduces alert fatigue for responders.

# Analyze Attacks

1. Note the two active Attackers
2. Click on the jbhunter@darkweb.com Attacker
3. Note each attacker is given a severity and threat score. We will use this information in a later track.


# Event Details
1. Click into the top event
  In order to identify an attack, the entire HTTP request must be parsed. Here you can see the Request/Response headers and bodies. All the information you need to confirm this attack.
2. Note the API Call chain and the attacked endpoint

# View Session
Clicking into the "View Session" link on the right takes you to the Trace Explorer. This is our data lake. All the http requests (malicious and benign) can be analyzed here. In the search input, add "Is Endpoint PII = true" and hit enter. If no results, great! The attacker was not exposed to PII information. If you want, feel free to back out to the previous Activity Log screen and select a different attack.
