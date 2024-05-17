
# RDepot kubernetes demo

*Important: this overlay is not recommended for production use.*

The demo provisions the following in a namespace:
* 1 RDepot repository server *"demo"*
* 1 RDepot manager app which
* 1 Postgres instance

Minikube is recommended to run the demo, but other distributions of kubernetes should also work as long as dynamic volume provisioning is supported.

## Deployment

```bash
minikube start
```

```bash
kubectl create ns demo-rdepot
# cd overlays/demo
kustomize build . | kubectl apply -f -
```

wait until your pods are ready:
```bash
kubectl -n demo-rdepot get pods
```

## Port-forwarding the services

To forward the Manager app, run
```bash
kubectl -n demo-rdepot port-forward svc/rdepot-app 8080:80
```

and point your browser at http://localhost:8080 (login `einstein`/`testpassword`)

Make sure to publish your the demo repository from the *Repositories* page. 

To forward the Repository web server, run
```bash
kubectl -n demo-rdepot port-forward svc/rdepot-repo 8081:80
```
and point your browser or R environment at http://localhost:8081/repo/demo

## Teardown

```bash
kubectl delete namespace demo-rdepot
```

```bash
minikube stop
```

## References

* https://minikube.sigs.k8s.io/docs/handbook/persistent_volumes/
* https://minikube.sigs.k8s.io/docs/start/

