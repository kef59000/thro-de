### Exercise: Creating and Running a Simple Pod in Kubernetes

#### Objective

In this exercise, you will create and start a simple pod in your Kubernetes cluster that contains an Nginx web server container.

#### Prerequisites

- Kubernetes cluster (e.g., [Docker Desktop with Kubernetes enabled](https://docs.docker.com/desktop/kubernetes/), [Minikube](https://minikube.sigs.k8s.io/docs/start/))
- [kubectl](https://kubernetes.io/docs/tasks/tools/) (included in Docker Desktop)

#### Steps

1. **Open Your Terminal**: Launch your command line interface (CLI).

2. **Create Pod Definition**: Create a YAML file for your pod. Name the file `nginx-pod.yaml`.

   ```yaml
   apiVersion: v1
   kind: Pod
   metadata:
     name: nginx-pod
     labels:
       app: nginx
   spec:
     containers:
       - name: nginx
         image: nginx:latest
         ports:
           - containerPort: 80
   ```

   This YAML file defines a pod named `nginx-pod`, running a container from the official Nginx image (`nginx:latest`).

3. **Create the Pod**: Execute the following command to create the pod:

   ```bash
   kubectl apply -f nginx-pod.yaml
   ```

4. **Check Pod Status**: After the pod has been created, you can check its status. This confirms whether the pod is running properly.

   ```bash
   kubectl get pods
   ```

   You should see output confirming that the `nginx-pod` is in the `Running` status.

5. **Accessing the Nginx Server**: Since the pod is running inside the cluster, you cannot directly access the Nginx server via your browser. To access the Nginx server, you can use the following command:

   ```bash
   kubectl port-forward pod/nginx-pod 8080:80
   ```

   This forwards local port 8080 to port 80 of the Nginx server in the pod. Now open your web browser and navigate to `http://localhost:8080`. You should see the default welcome page of Nginx.

6. **Cleanup**: After completing the exercise, you should delete the created pod to free up resources.

   ```bash
   kubectl delete -f nginx-pod.yaml
   ```

#### Reflection

Having completed this exercise, you should now be able to create and manage basic pods in Kubernetes. Consider how pods could be used in larger applications and their role in a microservices architecture.
