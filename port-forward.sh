kubectl port-forward  -n gitea --address 0.0.0.0 svc/gitea 3000:3000 &  
kubectl port-forward  -n nephio-webui --address 0.0.0.0 svc/nephio-webui 7007:7007  &
