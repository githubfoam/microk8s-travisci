IMAGE := alpine/fio
APP:="app/deploy-openesb.sh"

deploy-dashboard-rbac:
	bash app/deploy-dashboard-rbac.sh
deploy-dashboard:
	bash app/deploy-dashboard.sh

deploy-fluentd:
	bash app/deploy-istio-knative.sh
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
