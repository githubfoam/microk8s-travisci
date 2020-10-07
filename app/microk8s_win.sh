#https://microk8s.io/docs/install-alternatives
fleet_script_microk8s_win_tasks : &fleet_script_microk8s_win_tasks #If you are running minikube within a VM, consider using --driver=none
      script:
          - choco install wget
          - wget https://github.com/ubuntu/microk8s/releases/download/installer-v2.0.0/microk8s-installer.exe
          - dir
          #PowerShell
          # - pwsh -c 'if(-not (Get-Module -ListAvailable -Name BadModuleName)){ exit 1 }' && echo yes || echo no #check if Powershell has a certain module installed
          # - client = new-object System.Net.WebClient
          # - pwsh client.DownloadFile("https://github.com/ubuntu/microk8s/releases/download/installer-v2.0.0/microk8s-installer.exe","C:\tmp\microk8s-installer.exe")
          # #PowerShell
          # - pwsh -c 'if(-not (Get-Module -ListAvailable -Name Invoke-WebRequest)){ exit 1 }' && echo yes || echo no #check if Powershell has a certain module installed
          # - pwsh Invoke-WebRequest -OutFile microk8s-installer.exe https://github.com/ubuntu/microk8s/releases/download/installer-v2.0.0/microk8s-installer.exe #PowerShell >= 3.0
          # - iwr -outf 1_microk8s-installer.exe https://github.com/ubuntu/microk8s/releases/download/installer-v2.0.0/microk8s-installer.exe #PowerShell >= 3.0
          # - bitsadmin /transfer myDownloadJob /download /priority normal http://downloadsrv/10mb.zip c:\10mb.zip
          # - bitsadmin /transfer myDownloadJob /download /priority normal https://github.com/ubuntu/microk8s/releases/download/installer-v2.0.0/microk8s-installer.exe c:\microk8s-installer.exe
          # - microk8s status --wait-ready
          # - microk8s enable dashboard dns registry istio # enable add-ons, services
          # - microk8s kubectl get all --all-namespaces
          # - microk8s dashboard-proxy
