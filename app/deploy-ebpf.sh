#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script


#https://github.com/fntlnz/influxdb-ebpf-example
echo "=============================deploy ebpf testing============================================================="
microk8s kubectl get pods --all-namespaces
microk8s kubectl get pod -o wide #The IP column will contain the internal cluster IP address for each pod.
microk8s kubectl get service --all-namespaces # find a Service IP,list all services in all namespaces
microk8s kubectl get nodes
microk8s kubectl get services

https://github.com/fntlnz/influxdb-ebpf-example.git && cd influxdb-ebpf-example
microk8s kubectl create namespace monitoring
microk8s kubectl apply -f deploy.yml


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
microk8s status

#https://github.com/nirmata/kube-netc
echo "=============================deploy ebpf testing============================================================="
#Install kube-netc
microk8s kubectl apply -f https://github.com/nirmata/kube-netc/raw/master/config/install.yaml
microk8s kubectl get pods | grep kube-netc

#In a new terminal, port-forward the port of the pod, access with curl outside the cluster with
#microk8s kubectl port-forward kube-netc-j56cx 2112:2112 &

#2112 is the port to access the Prometheus endpoint
#curl the /metrics endpoint on the local host to show the Prometheus metrics
#curl localhost:2112/metrics | grep bytes
