# Deploy your First Landing Zone

> Note: this section of the documentation is under construction

<!-- todo: decide what goes on the github repo readme vs. this place and how to link between them  -->
 
This tutorial will lead you through the steps to get started with landing zone construction kit

- [Install Orbit](https://github.com/OCTOcloud/Orbit-cli#-install-and-usage)
- Create a Foundation
- Add a cloud platform to your foundation
- Create and deploy a landing zone to this cloud platform (using an existing kit module)

The kit is meant to be comfortably used with [Orbit cli](https://github.com/OCTOcloud/Orbit-cli) using a "fork and own"
approach - you will ulitmately build your own kit to meet your organizations unique requirements based on the public examples in this kit.
After installing Orbit, start by creating a new git repository and creating a new foundation.

```shell
git init my-foundation-kit
cd my-foundation-kit
Orbit init
Orbit foundation new my-foundation-dev
```

A foundation describes a number of cloud platforms (e.g. AWS and GCP), landing zones, cloud customers (development teams in your organization) and their cloud tenants (e.g. AWS Accounts and GCP projects).
The `Orbit` cli will interactively
prompt you for about the configuration settings it needs to successfully connect to your cloud platforms. After setting
up your first foundation, your repository will look like this:

```shell
$ tree
.
└── foundations
    └── my-foundation-dev
        ├── README.md
        └── platforms
            └── gcp
                └── README.md
```

Next, let's create our first kit module and apply it to our platform.

```shell
Orbit kit new "my-first-gcp-module"
Orbit kit apply "my-first-gcp-module" --foundation my-foundation-dev --platform gcp
```

This generated a new executable terraform module at `kit/my-first-gcp-module` and a terragrunt module wrapper
that simplifies executing that module (e.g. by managing common backend and provider configurations). at `foundations/my-foundation-dev/platforms/gcp`.

```shell
22:07 $ tree
.
├── foundations
│   └── my-foundation-dev
│       ├── README.md
│       └── platforms
│           └── gcp
│               ├── README.md
│               └── terragrunt.hcl
└── kit
    └── my-first-gcp-module
        ├── README.md
        ├── documentation.tf
        └── main.tf
```

Inside the kit module, you can define any reusable set of functionality that your cloud foundation needs. A common
module you will want to add to your kit is setting up organization-wide constraints at the root of the cloud
resource hierarchy. Since a kit module is a standard terraform module, you can leverage official modules
like `terraform-google-modules/org-policy/google` to set up organization policies.

After you're done with your first module, `Orbit` can help you deploy your cloud foundation, running `terragrunt` transparently under the hood for you:

```shell
Orbit foundation deploy my-foundation
deploying (plan) foundations/my-foundation ...
deploying (plan) foundations/my-foundation/gcp ...
```

### Next Steps

To go from this simple introduction to a productive use of the landing zone construction kit we recommend reviewing
our example implementation of a cloud foundation.

- add a second (productive) cloud foundation `Orbit foundation new my-foundation-prod`
- review kit module usage `Orbit kit tree` to ensure/dev-prod parity
- build an interactive documentation for your cloud foundation using `Orbit docs`
- document compliance controls and their implementation using `Orbit compliance`
