#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script


# Install microk8s >= 1.15 as per microk8s documentation: MicroK8s User guide.
# https://docs.cilium.io/en/latest/gettingstarted/microk8s/
echo "=============================deploy cilium============================================================="
microk8s.enable cilium
#yes | sudo microk8s enable cilium

echo "Waiting for  cilium to be ready ..."
for i in {1..60}; do # Timeout after 3 minutes, 60x5=300 secs
     if microk8s kubectl get pods --namespace=kube-system  | grep ContainerCreating ; then
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