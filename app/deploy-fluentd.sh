#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script


# https://microk8s.io/docs/addon-fluentd
# https://microk8s.io/docs/addons#heading--list
echo "=============================deploy fluentd============================================================="
microk8s.enable fluentd

echo "Waiting for  fluentd to be ready ..."
for i in {1..60}; do # Timeout after 3 minutes, 60x5=300 secs
     if microk8s kubectl get pods --namespace=kube-system  | grep ContainerCreating ; then
         sleep 5
     else
         break
     fi
done

#access the Kibana dashboard
microk8s kubectl proxy &
curl http://127.0.0.1:8001/api/v1/namespaces/kube-system/services/kibana-logging/proxy/app/kibana

microk8s kubectl get pods --all-namespaces
microk8s kubectl get pod -o wide #The IP column will contain the internal cluster IP address for each pod.
microk8s kubectl get service --all-namespaces # find a Service IP,list all services in all namespaces
microk8s kubectl get nodes
microk8s kubectl get services
microk8s status
