---
slug: train-the-ai-and-access-the-ui
id: tpdlzgmyvfcp
type: challenge
title: Train the AI and Access the UI
teaser: This lesson provides an introduction into the UI and walks you through how
  to train our AI models for security analysis and protection.
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
With the sidecar proxy set up we're ready to start diving into the mechanincs of Traceable and how it can provide value to your development and security teams. So the first piece of information you'll want to grab is your Environment ID. In a traditional setting this value would represent what evironment Traceable is running in, i.e STAGING, QA, DEV or PROD, and would be shown in the UI so one could filter their data. In the context of this workshop we're all using the same tenant within Traceable and we have assigned each student a unique environment ID to segregate everybody's data. Run the following to get your ID:

```bash
echo $_SANDBOX_ID
```
Now copy this value and hold on to it, because we'll be using it once we log in to the Traceable UI. To log in please visit https://app.traceable.ai and select the "Log In" tab. Use the credentials on the sheet of paper in front of you to log in. Once you're in, select your environment in the top left hand corner (see above)

You can click on the "Juice Shop" tab and click around the application to begin generating traces.

When a tracing agent is first deployed, it's collecting data to essential train our backend models in an effort to build an understanding of the application's API flow and business logic. Typically we're deploying these agents in a Production environment making the training process a trivial task. In the scope of this workshop we'll use a predefinied postman script to conduct the "training". The commands below will show you how to kick this off:

```bash
(newman run juice-shop-training.json -e vars.json -n 15 2>&1 > ~/training.output) &

```
This script will exercise most of the significant API endpoints in JuiceShop and use/create multiple user profiles, and varied data in the requestss to simulate real world traffic. Our models will not generate security events for API Endpoints that aren't "confidently learnt" meaning we must provide sufficiently varied tracing data to the Traceable platform in order to start doing security analysis on the application's traffic.

Now we'll leave this running which should take a few minutes and explore the UI.
