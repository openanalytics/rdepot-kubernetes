
# RDepot kubernetes demo

*Important: this overlay is not recommended for production use.*

The demo provisions the following in a namespace:
* 1 RDepot repository server
* 1 RDepot manager app which is a backend
* 1 RDepot client which is a frontend
* 1 Postgres instance

Minikube is recommended to run the demo, but other distributions of kubernetes should also work as long as dynamic volume provisioning is supported.

## Deployment

```bash
minikube start
minikube addons enable ingress
```

This demo includes Ingress resource with associated domain: `rdepot.demo`. Therefore, to get access to RDepot, local DNS resolver has to be updated.

For Linux - add the following entry to `/etc/hosts`, replacing MINIKUBE_IP by the output of `$ minikube ip` command:
```bash
MINIKUBE_IP rdepot.demo
```

Then you are ready to deploy demo application.

```bash
# cd overlays/demo
kustomize build . | kubectl apply -f -
```

wait until your pods are ready:
```bash
kubectl -n demo-rdepot get pods
```

Application will be available at http://rdepot.demo

In [this file](./config/authentication.yml) credentials for test users can be found.

## Teardown

```bash
kubectl delete namespace rdepot-demo
```

```bash
minikube stop
```

## References

* https://minikube.sigs.k8s.io/docs/handbook/persistent_volumes/
* https://minikube.sigs.k8s.io/docs/start/

