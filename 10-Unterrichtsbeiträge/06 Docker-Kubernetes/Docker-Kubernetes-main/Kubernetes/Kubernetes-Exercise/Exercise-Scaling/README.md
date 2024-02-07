### Exercise: Deploying and Scaling an Application in Kubernetes

#### Objective

In this exercise, you will deploy a web application in Kubernetes using a Deployment resource and then scale it to handle increased load.

#### Prerequisites

- Kubernetes cluster (e.g., [Docker Desktop with Kubernetes enabled](https://docs.docker.com/desktop/kubernetes/), [Minikube](https://minikube.sigs.k8s.io/docs/start/))
- [kubectl](https://kubernetes.io/docs/tasks/tools/) (included in Docker Desktop)

#### Steps

1. **Create the Deployment YAML File**:
   Create a file named `webapp-deployment.yaml`. This file will define the Deployment resource for a simple web application.

   ```yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: webapp-deployment
     labels:
       app: webapp
   spec:
     replicas: 2
     selector:
       matchLabels:
         app: webapp
     template:
       metadata:
         labels:
           app: webapp
       spec:
         containers:
           - name: webapp
             image: nginx:latest
             ports:
               - containerPort: 80
   ```

   This YAML file creates a Deployment named `webapp-deployment` with 2 replicas of Nginx web server.

2. **Deploy the Application**:
   Apply the Deployment configuration to your Kubernetes cluster.

   ```bash
   kubectl apply -f webapp-deployment.yaml
   ```

3. **Verify the Deployment**:
   Check the status of the newly created Deployment.

   ```bash
   kubectl get deployments
   ```

   You should see `webapp-deployment` with 2 replicas.

4. **Scaling the Deployment**:
   To scale the deployment to handle more load, increase the number of replicas.

   ```bash
   kubectl scale deployment webapp-deployment --replicas=5
   ```

5. Check the rollout status of the deployment.

   ```bash
   kubectl rollout status deployment/webapp-deployment
   ```

   Wait until you see the message `deployment "webapp-deployment" successfully rolled out`.

6. **Check the Updated Deployment**:
   Verify the scaling operation.

   ```bash
   kubectl get deployments
   ```

   The `webapp-deployment` should now show 5 replicas.

7. **Cleanup**:
   After completing the exercise, delete the deployment to free up resources.

   ```bash
   kubectl delete -f webapp-deployment.yaml
   ```

#### Reflection

Through this exercise, you have learned how to deploy and scale a web application in Kubernetes. Consider how you can apply these techniques to manage real-world applications, especially under varying load conditions.
