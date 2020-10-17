IMAGE := alpine/fio
APP:="app/deploy-openesb.sh"

deploy-ingress:
	bash app/deploy-ingress.sh

push-image:
	docker push $(IMAGE)

.PHONY: deploy-microk8s push-image
