---
home: true
title: Landing Zone Construction Kit
heroImage: /images/hero.png
actions:
  - text: Get Started
    link: /tutorial/
    type: primary
  - text: Introduction
    link: /guide/
    type: secondary
features:
  - title: Modular Approach
    details: Assemble landing zones from capability-focused building blocks.
  - title: GitOps-Enabled
    details: Manage landing zones and cloud tenants as code in git and automate workflows with GitOps.
  - title: Multi-Cloud Workflow
    details: Develop and deploy landing zones with a consistent workflow across all platforms.
  - title: Terraform Modules
    details: Leverage existing infrastructure as code built as Terraform modules.
  - title: Compliance Built-In
    details: Capture compliance requirements for your landing zones and document their implementation as policies.
  - title: Documentation
    details: Generate developer documentation for application teams building on your land zones and compliance documentation 
footer: Copyright © 2022-present OCTOcloud GmbH
---

## Build Landing Zones easily

Use [Orbit](https://github.com/OCTOcloud/Orbit-cli) cli to easily work with the landing zone construction kit

```shell
# initialize a new Orbit repository
Orbit init

# add a cloud foundation connecting your platforms
Orbit foundation new "my-foundation"

# create a new kit module with an infrastructure as code template
Orbit kit new "aws/organization-policies"   

# apply the kit module to one of your cloud foundation's platforms
Orbit kit apply "aws/organization-policies"

# deploy all modules applied to the foundation to build your landing zone
Orbit foundation deploy "my-foundation" 
```
