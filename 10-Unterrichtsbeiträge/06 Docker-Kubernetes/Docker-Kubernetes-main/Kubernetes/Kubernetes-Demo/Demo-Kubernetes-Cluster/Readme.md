## Kubernetes Demo, Setup Simple Cluster

### Requirements

In Docker Desktop Kubernetes aktivieren.
Docker Desktop startet ein Kubernetes single-node Cluster.

### K8s manifest files (config files)
* mongo-config.yaml
* mongo-secret.yaml
* mongo.yaml
* webapp.yaml

### Steps to setup Cluster

#### Verifiziere das Kubernetes läuft
    kubectl get all

    kubectl get namespaces

###  Push .yaml Konfigurationen ins Cluster to Master Node (Reihenfolge beachten)
    # Mongo Config Map:
    kubectl apply -f .\mongo-configMap.yaml

    # Mongo Secrets:
    kubectl apply -f .\mongo-secret.yaml

    # Mongo Deployment und Service:
    kubectl apply -f .\mongo.yaml

    # Webapp und Service:
    kubectl apply -f .\webapp.yaml

#### Cluster ist erreichbar unter: http://localhost:30100

### Generelle Befehle
    kubectl cluster-info
    kubectl get all
    kubectl get nodes
    kubectl get pods
    kubectl get services
    kubectl get deployments
    kubectl apply -f <yaml-file> 
    kubectl get namespaces, Namespace anzeigen

#### Links
* mongodb image on Docker Hub: https://hub.docker.com/_/mongo
* webapp image on Docker Hub: https://hub.docker.com/repository/docker/nanajanashia/k8s-demo-app
* k8s official documentation: https://kubernetes.io/docs/home/
* webapp code repo: https://gitlab.com/nanuchi/developing-with-docker/-/tree/feature/k8s-in-hour