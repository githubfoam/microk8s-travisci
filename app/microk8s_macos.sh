#https://microk8s.io/docs/install-alternatives
fleet_script_microk8s_macos_tasks : &fleet_script_microk8s_macos_tasks #If you are running minikube within a VM, consider using --driver=none
      script:
          - /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" #Install Homebrew
          # - microk8s install
          # - microk8s status --wait-ready
          # - microk8s enable dashboard dns registry istio # enable add-ons, services
          # - microk8s kubectl get all --all-namespaces
          # - microk8s dashboard-proxy
