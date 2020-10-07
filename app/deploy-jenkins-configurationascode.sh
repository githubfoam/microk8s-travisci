#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "=============================deploy jenkins configuration as code============================================================="
microk8s.enable dns dashboard
microk8s.kubectl proxy &
#docker images 
microk8s.enable registry 

echo 'Take a 15 sec for the registery!'
sleep 15

microk8s.docker build -t localhost:32000/jenkins:1.0 jenkins
microk8s.docker push localhost:32000/jenkins:1.0

microk8s.docker build -t localhost:32000/jenkins-slave:1.0 jenkins-slave
microk8s.docker push localhost:32000/jenkins-slave:1.0

microk8s.kubectl apply -f ./jenkins/jenkins-serviceaccount.yaml
microk8s.kubectl apply -f ./jenkins/jenkins-config.yaml
microk8s.kubectl apply -f ./jenkins/jenkins-deployment.yaml

echo 'Sleep for 15 seconds the pod can start'
sleep 15

microk8s.kubectl port-forward svc/jenkins 9000:9000

# curl http://localhost:9000 

#verify
# curl  http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy

# get service 
microk8s.kubectl cluster-info | grep master #e.g. local-ip:8080

microk8s.kubectl get pods | grep jenkins 



