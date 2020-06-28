#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script


# https://github.com/jaegertracing/jaeger-operator
# https://microk8s.io/docs/addons#heading--list
echo "=============================deploy jaeger============================================================="
microk8s.enable jaeger

microk8s kubectl get pods --all-namespaces
echo "Waiting for  jaeger to be ready ..."
for i in {1..60}; do # Timeout after 3 minutes, 60x5=300 secs
     if microk8s kubectl get pods --namespace=observability  | grep ContainerCreating ; then
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

#Once the jaeger-operator deployment in the namespace observability is ready, create a Jaeger instance
#create a Jaeger instance named simplest
#The Jaeger UI is served via the Ingress
kubectl apply -n observability -f - <<EOF
apiVersion: jaegertracing.io/v1
kind: Jaeger
metadata:
  name: simplest
EOF
kubectl get ingress
