#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "=============================deploy cilium============================================================="
microk8s.enable cilium
#yes | sudo microk8s enable cilium     
