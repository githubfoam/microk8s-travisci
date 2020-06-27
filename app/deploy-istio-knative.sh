#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

#https://microk8s.io/#get-started
#https://microk8s.io/docs
#https://istio.io/docs/setup/platform-setup/microk8s/
#https://linkerd.io/2020/03/23/serverless-service-mesh-with-knative-and-linkerd/
#knative: Adds the Knative middleware to your cluster (not available on arm64 arch).
echo "=============================deploy linkerd knative============================================================="
microk8s.enable linkerd
microk8s.enable knative
#yes | sudo microk8s enable cilium

microk8s kubectl get pods --all-namespaces
microk8s kubectl get pod -o wide #The IP column will contain the internal cluster IP address for each pod.
microk8s kubectl get service --all-namespaces # find a Service IP,list all services in all namespaces
microk8s kubectl get nodes
microk8s kubectl get services
