# microk8s-travisci
microk8s pipeline

Travis (.com)   branch:
[![Build Status](https://travis-ci.com/githubfoam/microk8s-travisci.svg?branch=master)](https://travis-ci.com/githubfoam/microk8s-travisci)  

Travis (.com) feature_serverless branch:
[![Build Status](https://travis-ci.com/githubfoam/microk8s-travisci.svg?branch=feature_serverless)](https://travis-ci.com/githubfoam/microk8s-travisci) 

Travis (.com)  feature_prometheus  branch:
[![Build Status](https://travis-ci.com/githubfoam/microk8s-travisci.svg?branch=feature_prometheus)](https://travis-ci.com/githubfoam/microk8s-travisci) 

Travis (.com)  feature_knative branch:
[![Build Status](https://travis-ci.com/githubfoam/microk8s-travisci.svg?branch=feature_knative)](https://travis-ci.com/githubfoam/microk8s-travisci) 

Travis (.com)  feature_dashboard branch:
[![Build Status](https://travis-ci.com/githubfoam/microk8s-travisci.svg?branch=feature_dashboard)](https://travis-ci.com/githubfoam/microk8s-travisci) 

Travis (.com)   feature_jaeger  branch:
[![Build Status](https://travis-ci.com/githubfoam/microk8s-travisci.svg?branch=feature_jaeger)](https://travis-ci.com/githubfoam/microk8s-travisci) 

Travis (.com)   feature_cilium  branch:
[![Build Status](https://travis-ci.com/githubfoam/microk8s-travisci.svg?branch=feature_cilium)](https://travis-ci.com/githubfoam/microk8s-travisci) 

Travis (.com)   feature_istio  branch:
[![Build Status](https://travis-ci.com/githubfoam/microk8s-travisci.svg?branch=feature_istio)](https://travis-ci.com/githubfoam/microk8s-travisci)

Travis (.com)   feature_linkerd  branch:
[![Build Status](https://travis-ci.com/githubfoam/microk8s-travisci.svg?branch=feature_linkerd)](https://travis-ci.com/githubfoam/microk8s-travisci)

Travis (.com)   feature_fluentd  branch:
[![Build Status](https://travis-ci.com/githubfoam/microk8s-travisci.svg?branch=feature_juju)](https://travis-ci.com/githubfoam/microk8s-travisci)

Travis (.com)   macos  branch:
[![Build Status](https://travis-ci.com/githubfoam/microk8s-travisci.svg?branch=macos)](https://travis-ci.com/githubfoam/microk8s-travisci)

Travis (.com)   linux  branch:
[![Build Status](https://travis-ci.com/githubfoam/microk8s-travisci.svg?branch=linux)](https://travis-ci.com/githubfoam/microk8s-travisci)

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
