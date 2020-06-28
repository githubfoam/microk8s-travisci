#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script


# https://microk8s.io/docs/addon-dashboard
# https://microk8s.io/docs/addons#heading--list
#https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/README.md#admin-privileges
echo "=============================deploy cilium============================================================="
microk8s.enable dashboard
microk8s enable rbac

echo "Waiting for  cilium to be ready ..."
for i in {1..60}; do # Timeout after 3 minutes, 60x5=300 secs
     if microk8s kubectl get pods --namespace=kube-system  | grep ContainerCreating ; then
         sleep 5
     else
         break
     fi
done

#reach the dashboard by forwarding its port to a free one on the host
# microk8s kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443
# curl https://127.0.0.1:10443

microk8s kubectl get pods --all-namespaces
microk8s kubectl get pod -o wide #The IP column will contain the internal cluster IP address for each pod.
microk8s kubectl get service --all-namespaces # find a Service IP,list all services in all namespaces
microk8s kubectl get nodes
microk8s kubectl get services
microk8s status
