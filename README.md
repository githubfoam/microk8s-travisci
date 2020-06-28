# microk8s-travisci
microk8s pipeline

Travis (.com) branch:
[![Build Status](https://travis-ci.com/githubfoam/microk8s-travisci.svg?branch=dev)](https://travis-ci.com/githubfoam/microk8s-travisci)  

~~~~
MicroK8s Addons

cilium: Deploys Cilium to support Kubernetes network policies using eBPF.
istio: Adds the core Istio services (not available on arm64 arch).
knative: Adds the Knative middleware to your cluster (not available on arm64 arch).
linkerd: Deploys the linkerd service mesh (not available on arm64 arch).
dashboard: The standard Kubernetes Dashboard
fluentd: Deploy the Elasticsearch-Fluentd-Kibana logging and
monitoring solution.
jaeger: Deploy the Jaeger Operator in the “simplest”
configuration.
juju: Enables a juju client to work with MicroK8s.
ingress: A simple ingress controller for external access.

https://microk8s.io/docs/addons#heading--list
~~~~

~~~~

Cloud-init is the industry standard multi-distribution method for cross-platform cloud instance initialization. It is supported across all major public cloud providers, provisioning systems for private cloud infrastructure, and bare-metal installations.
https://cloudinit.readthedocs.io/en/latest

Kubernetes storage
https://openebs.io
OpenZFS on Linux and FreeBSD
https://github.com/openzfs/zfs

Native ZFS on Linux
https://zfsonlinux.org/

Lightweight Kubernetes
https://microk8s.io/

macOS Version
The default backend on macOS is hyperkit, wrapping Apple’s Hypervisor.framework
You need macOS Yosemite, version 10.10.3 or later installed on a 2010 or newer Mac
https://docs.travis-ci.com/user/reference/osx/#macos-version
~~~~
