#!/bin/bash

rm -rf regional

pkg_id=$(porchctl rpkg get --name nephio-workload-cluster | awk '/catalog-infra-capi/  {a=$0;n=NR} END{print $1}')

echo "Pkg ID : $pkg_id"

rpkg_id=$(porchctl rpkg clone -n default $pkg_id --repository mgmt regional | awk '{print $1}')


echo "Rpkg ID : $rpkg_id"

porchctl rpkg pull -n default $rpkg_id regional

sleep 1

kpt fn eval --image gcr.io/kpt-fn/set-labels:v0.2.0 regional -- "nephio.org/site-type=regional" "nephio.org/region=us-west1"

sleep 1

porchctl rpkg push -n default $rpkg_id regional

sleep 1

porchctl rpkg propose -n default $rpkg_id

sleep 1

porchctl rpkg approve -n default $rpkg_id
