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



