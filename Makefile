IMAGE := alpine/fio
APP:="app/deploy-openesb.sh"

deploy-fluentd:
	bash app/deploy-fluentd.sh

deploy-microk8s:
	bash app/deploy-microk8s.sh

push-image:
	docker push $(IMAGE)
	
.PHONY: deploy-microk8s push-image
