#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script


# https://github.com/juju-solutions/bundle-kubeflow/blob/master/README.md
# https://microk8s.io/docs/addons#heading--list
echo "=============================deploy kubeflow juju bundle============================================================="

usermod -aG microk8s $USER

microk8s.enable kubeflow
microk8s.enable juju

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

#set up microk8s
python3 --version
python3 scripts/cli.py microk8s setup --controller uk8s
#The deploy-to command allows manually setting a public address that is used for accessing Kubeflow on MicroK8s
python3 scripts/cli.py deploy-to uk8s

#configure MicroK8s to use LAN DNS instead of the default of 8.8.8.8
# edit the coredns configmap
#Edit the line with 8.8.8.8   8.8.4.4 to use your local DNS, e.g. 192.168.1.1
microk8s.kubectl edit configmap -n kube-system coredns


juju destroy-model kubeflow --release-storage #Alternatively,simply release storage instead of deleting it
juju destroy-model kubeflow --yes --destroy-storage --force #remove Kubeflow from your Kubernetes cluster
