#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "=============================deploy istio============================================================="
microk8s.enable istio


#Istio needs to inject sidecars to the pods of your deployment
#In microk8s auto-injection is supported  label the namespace you will be using with istion-injection=enabled
# microk8s kubectl label namespace default istio-injection=enabled #The connection to the server 127.0.0.1:16443 was refused - did you specify the right host or port?
# wget -nv https://raw.githubusercontent.com/istio/istio/release-1.0/samples/bookinfo/platform/kube/bookinfo.yaml  #the bookinfo example from the v1.0 Istio release
# microk8s.kubectl create -f bookinfo.yaml
#reach the services using the ClusterIP they have
#for example get to the productpage in the above example by pointing our browser to 10.152.183.59:9080
# microk8s kubectl get svc
# wget -nv https://raw.githubusercontent.com/istio/istio/release-1.0/samples/bookinfo/networking/bookinfo-gateway.yaml #exposing the services via NodePort:
# microk8s kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}' 31380 #get to the productpage through ingress
# curl http://localhost:31380/productpage
#nc http://localhost:31380/productpage
# microk8s kubectl -n istio-system get svc grafana
# microk8s kubectl -n istio-system get svc prometheus
# microk8s kubectl -n istio-system get service/jaeger-query
# microk8s kubectl -n istio-system get servicegraph

echo "Waiting for  istio to be ready ..."
for i in {1..60}; do # Timeout after 3 minutes, 60x5=300 secs
     if microk8s kubectl get pods --namespace=istio-system  | grep ContainerCreating ; then
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
