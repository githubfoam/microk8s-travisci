IMAGE := alpine/fio
APP:="app/deploy-openesb.sh"

deploy-cilium:
	bash app/deploy-cilium.sh
deploy-microk8s:
	bash deploy-microk8s.sh
push-image:
	docker push $(IMAGE)
.PHONY: deploy-microk8s push-image
