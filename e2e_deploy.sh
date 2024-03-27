#!/bin/bash

cd test-infra

sudo NEPHIO_DEBUG=false        NEPHIO_BRANCH=v2.0.0      NEPHIO_USER=ubuntu        e2e/provision/init.sh

sleep 10

cd ..

./create_reg_cl.sh

sleep 60

./create_edge_cl.sh


echo "Waiting for cluster creation"
while [ $(kubectl get machine | wc -l) -lt 5 ];
do
	sleep 600
done	
echo "Cluster Creation done"
kubectl get machine


echo "Wait for cluster reay event"
sleep 300

./setup_networking.sh

echo "Waiting for network creation"
while [ $(kubectl get networks | wc -l) -lt 6 ];
do
	sleep 60
done
echo "Network creation done"

echo "Deploying edge componenets"

kubectl apply -f test-infra/e2e/tests/free5gc/004-free5gc-operator.yaml
kubectl apply -f test-infra/e2e/tests/free5gc/005-edge-free5gc-upf.yaml

echo "Deploying regional components"

kubectl apply -f  test-infra/e2e/tests/sdcore4g/004-sdcore4g-operator.yaml
kubectl apply -f  test-infra/e2e/tests/sdcore4g/006-regional-sdcore4g-mme.yaml
kubectl apply -f  test-infra/e2e/tests/sdcore4g/006-regional-sdcore4g-spgwc.yaml

echo "Deployment done verify the status on dashboard"


