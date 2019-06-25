# Paasify CLI

A simple CLI for creating quick, non-production and disposable Pivotal Application Service foundations for testing, demos and prototypes. All you need to being is your own public cloud accounts and DNS. This is built on top of the core [pcf-paasify](https://github.com/nthomson-pivotal/pcf-paasify) Terraform configuration modules.

```
paasify create-env -n myenv -v 2.6 -c aws -d aws.paasify.org

paasify apply -n myenv -a
```

This will:
- Install PAS 2.6 Small Footprint on AWS
- Perform all PivNet product downloads/uploads on the OpsMan VM for speed
- Scale down all resources for minimal IaaS cost
- Wire up DNS so that its accessible at `myenv.aws.paasify.org`
- Provision valid SSL certificates via Lets Encrypt for every common HTTPS endpoint
- Allow you to cleanly tear down all infrastructure via `paasify destroy`

When the commands complete execution you have a working PAS environment.

Other features include:
- Convenience commands to access CF, OpsManager and BOSH
- Optionally use Terraform Enterprise (which is free) to store state remotely

## Installing

Basic steps:

```
git clone https://github.com/nthomson-pivotal/paasify-cli.git

eval "$($PWD/paasify-cli/bin/paasify init -)"

paasify update

paasify help
```

## Usage

The command `paasify help` will provide a guide of the available sub-commands, similar to this:

```
$ paasify
Usage: paasify <command> [<args>]

Some useful paasify commands are:
   apply     Apply the configuration for a given environment
   bosh-env  Output that can be eval'ed to access to BOSH director
   cf-login  Login the local CF CLI to the PAS installed
   commands  List all paasify commands
   config    Configure the CLI
   create    Create a new environment
   destroy   Destroy a given environment
   om-info   Print information about the OpsManager that was created, including endpoint and credentials
   plan      Show the plan for a given environment
   ssh       Open an SSH connection to the OpsManager for a given environment
   update    Pull latest paasify modules
   versions  List the current versions that are available

See 'paasify help <command>' for information on a specific command.
```