# Actualbudget Server Cloudron App

This repository contains the [Cloudron](cloudron.io) app package source for the [actualbudget server](https://github.com/actualbudget/actual-server). [Actual](https://actualbudget.org/) is a fast, privacy-friendly personal budgeting tool.

## Installation

This custom Cloudron app has not yet been published to the official Cloudron app store. Hence in order to install it to your Cloudron instance, you must first build and deploy it to a private docker registry.

The easiest way to do this is to use Cloudron's pre-packaged [Private Docker Registry](https://docs.cloudron.io/apps/docker-registry/) app.

## Building
The app package can be built using the [Cloudron command line tooling](https://cloudron.io/references/cli.html).

### Build and Push to Private Docker Registry

```bash
cd actual-server-app
cloudron build
cloudron install --image registry.example.com/actual-server-app:${TAG}
```

## Testing

The e2e tests are located in the `test/` folder and require [nodejs](http://nodejs.org/). The tests include: creating a new Cloudron installation, backup up an existing installation, restoring from backup, moving to new location (i.e. subdomain), as well as testing the uninstallation process.

```bash
cd actualbudget-server-app/test

npm install
USERNAME=<cloudron username> PASSWORD=<cloudron password> mocha test.js
```
