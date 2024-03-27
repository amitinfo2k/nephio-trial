#!/bin/bash

kind delete cluster -n regional
kind delete cluster -n edge01
kind delete cluster
sleep 1
docker stop net-5g-leaf
docker rm net-5g-leaf

rm -f /tmp/*-kubeconfig
