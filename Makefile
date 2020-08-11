IMAGE := alpine/fio
APP:="app/deploy-openesb.sh"

deploy-chaosmesh:
	bash app/deploy-chaosmesh.sh
	
deploy-ebpf:
	bash app/deploy-ebpf.sh
deploy-kubeflow:
	bash app/deploy-kubeflow.sh
deploy-juju:
	bash app/deploy-juju.sh

deploy-jaeger:
	bash app/deploy-jaeger.sh
deploy-ingress:
	bash app/deploy-ingress.sh
deploy-dashboard-rbac:
	bash app/deploy-dashboard-rbac.sh
deploy-dashboard:
	bash app/deploy-dashboard.sh
deploy-fluentd:
	bash app/deploy-fluentd.sh

deploy-istio-knative:
	bash app/deploy-istio-knative.sh
deploy-istio:
	bash app/deploy-istio.sh
deploy-knative:
	bash app/deploy-knative.sh
deploy-linkerd-knative:
	bash app/deploy-linkerd-knative.sh
deploy-linkerd:
	bash app/deploy-linkerd.sh
deploy-cilium:
	bash app/deploy-cilium.sh
deploy-microk8s:
	bash app/deploy-microk8s.sh
push-image:
	docker push $(IMAGE)
.PHONY: deploy-microk8s push-image
