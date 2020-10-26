
# RDepot kubernetes demo

*Important: this overlay is not recommended for production use.*

## Minikube

```
minikube start
```

```
kubectl create ns demo-rdepot
# cd overlays/demo
kustomize build . | kubectl apply -f -
```

# References

* https://minikube.sigs.k8s.io/docs/handbook/persistent_volumes/

# Notes TODO remove

volume should be mounted under /opt/rdepot/generated
this is where rdepot manager puts its stuff
can be configured?
- mention on config page
- mention on kube page
- mention in this README


