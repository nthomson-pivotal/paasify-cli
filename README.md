# Paasify CLI

A simple CLI for creating quick, non-production and disposable Pivotal Application Service foundations for testing, demos and prototypes. All you need to being is your own public cloud accounts and DNS.

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