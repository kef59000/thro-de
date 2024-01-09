### Exercise: Deploying Portainer with Helm in Kubernetes

#### Objective

In this exercise, you'll deploy Portainer, a user-friendly container management tool, in your Kubernetes cluster using Helm, the package manager for Kubernetes.

#### Prerequisites

- Kubernetes cluster (e.g., [Docker Desktop with Kubernetes enabled](https://docs.docker.com/desktop/kubernetes/), [Minikube](https://minikube.sigs.k8s.io/docs/start/))
- [kubectl](https://kubernetes.io/docs/tasks/tools/) (included in Docker Desktop)
- [helm](https://helm.sh/docs/intro/install/)

#### Steps

1. **Add Portainer Helm Repository**:
   Before installing Portainer, add the Portainer Helm repository to your Helm configuration.

   ```bash
   helm repo add portainer https://portainer.github.io/k8s/
   helm repo update
   ```

2. **Install Portainer using Helm**:
   Install Portainer into your cluster using Helm. You can specify the namespace where Portainer should be deployed; if the namespace does not exist, Helm will create it.

   ```bash
   helm upgrade --install --create-namespace -n portainer portainer portainer/portainer
   ```

   This command installs Portainer under the namespace `portainer`, creating it if it doesn’t already exist.

3. **Verify the Installation**:
   Check if the Portainer Pods are up and running.

   ```bash
   kubectl get pods -n portainer
   ```

   You should see the Portainer pods in a running state. If you don't see the pods running, wait a few seconds and try again.

4. **Accessing Portainer UI**:
   When using Docker Desktop, Portainer is exposed via NodePort. To access the Portainer UI, you can use one of the following URLs:

   - http://localhost:30777
   - https://localhost:30779

   If not using Docker Desktop, you can use port forwarding.

   ```bash
   kubectl port-forward --namespace portainer service/portainer 9000:9000
   ```

   This command forwards the local port 9000 to the Portainer service on the same port. Now, you can access the Portainer UI by navigating to http://localhost:9000 in your web browser.

5. **Cleanup (Optional)**:
   If you need to remove Portainer from your cluster, you can uninstall it using Helm.

   ```bash
   helm uninstall -n portainer portainer
   ```

   This command removes the Portainer deployment from your Kubernetes cluster.

#### Reflection

This exercise demonstrates the simplicity and power of deploying complex applications like Portainer using Helm in Kubernetes. Reflect on how Helm streamlines the deployment and management of applications in Kubernetes and consider other use cases where Helm can be beneficial in your Kubernetes environment.
