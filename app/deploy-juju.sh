#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script


# https://juju.is/docs/what-is-juju
# https://microk8s.io/docs/addons#heading--list
echo "=============================deploy juju============================================================="
microk8s.enable juju

microk8s kubectl get pods --all-namespaces
echo "Waiting for  ingress to be ready ..."
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
microk8s status

microk8s.juju deploy mysql --to machine:0/lxc
