#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

#https://microk8s.io/#get-started
#https://microk8s.io/docs
#https://istio.io/docs/setup/platform-setup/microk8s/
echo "=============================deploy linkerd============================================================="

#ERRO[0000] could not set namespace from kubectl context: ensure a valid KUBECONFIG path has been set
microk8s.enable linkerd

echo "Waiting for  linkerd to be ready ..."
for i in {1..60}; do # Timeout after 3 minutes, 60x5=300 secs
     if microk8s kubectl get pods --namespace=linkerd   | grep ContainerCreating ; then
         sleep 5
     else
         break
     fi
done

microk8s kubectl get pods --all-namespaces
microk8s kubectl get pod -o wide #The IP column will contain the internal cluster IP address for each pod.
microk8s kubectl get service --all-namespaces # find a Service IP,list all services in all namespaces
microk8s kubectl get nodes
microk8s kubectl get services

# ERRO[0000] could not set namespace from kubectl context: ensure a valid KUBECONFIG path has been set
# × is running the minimum kubectl version
#     exec: "kubectl": executable file not found in $PATH
#     see https://linkerd.io/checks/#kubectl-version for hints
# microk8s linkerd check
microk8s status
