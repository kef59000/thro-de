# Kubernetes Rolling Update Demo

## Create a V1 Deployment

The file `hello-deployment.yaml` contains the deployment definition for the V1 of the hello-app.

### Create the Deployment

```bash
kubectl create -f hello-deployment.yaml
```

### Get the deployment status

```bash
kubectl rollout status deployment/hello-dep
```

### Get the pods list

```bash
kubectl get pods -o wide
```

### Describe the pod

```bash
kubectl describe pod hello-dep
```

### How many ReplicaSets do we have?

```bash
kubectl get rs
```

Leave the deployment running for the next steps.

---

## Create a V2 Deployment

Edit the `hello-deployment.yaml` file and change the image from `guybarrette/hello-app:1.0` to `guybarrette/hello-app:2.0`

### Create the Deployment

```bash
kubectl apply -f hello-deployment.yaml
```

### Get the deployment status

```bash
kubectl rollout status deployment/hello-dep
```

### Get the pods list

```bash
kubectl get pods -o wide
```

## How many ReplicaSets do we have?

```bash
kubectl get rs
```

### Get the deployment history

```bash
kubectl rollout history deployment/hello-dep
```

---

## Rollback

### Undo the last deployment using either

```bash
kubectl rollout undo deployment/hello-dep
```

or

```bash
kubectl rollout undo deployment/hello-dep --to-revision 1
```

### Get the deployment history

```bash
kubectl rollout history deployment/hello-dep
```

### How many ReplicaSets do we have?

```bash
kubectl get rs
```

## Cleanup

```bash
kubectl delete -f hello-deployment.yaml
```
