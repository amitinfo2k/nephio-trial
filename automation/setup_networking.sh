#!/bin/bash

kubectl get secret regional-kubeconfig -o jsonpath='{.data.value}' | base64 -d > $HOME/.kube/regional-kubeconfig
kubectl get secret edge01-kubeconfig -o jsonpath='{.data.value}' | base64 -d > $HOME/.kube/edge01-kubeconfig
export KUBECONFIG=$HOME/.kube/config:$HOME/.kube/regional-kubeconfig:$HOME/.kube/edge01-kubeconfig

export E2EDIR=${E2EDIR:-$HOME/test-infra/e2e}
export LIBDIR=${LIBDIR:-$HOME/test-infra/e2e/lib}
export TESTDIR=${TESTDIR:-$HOME/test-infra/e2e/tests/free5gc}
./test-infra/e2e/provision/hacks/inter-connect_workers.sh

sleep 2

./test-infra/e2e/provision/hacks/vlan-interfaces.sh

sleep 2

kubectl apply -f test-infra/e2e/tests/free5gc/002-network.yaml

kubectl apply -f test-infra/e2e/tests/free5gc/002-secret.yaml

./test-infra/e2e/provision/hacks/network-topo.sh

