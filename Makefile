IMAGE := alpine/fio
APP:="app/deploy-openesb.sh"

deploy-ingress:
	bash app/deploy-ingress.sh

deploy-dashboard-rbac:
	bash app/deploy-dashboard-rbac.sh

deploy-dashboard:
	bash app/deploy-dashboard.sh

deploy-microk8s:
	bash app/deploy-microk8s.sh

push-image:
	docker push $(IMAGE)

.PHONY: deploy-microk8s push-image
