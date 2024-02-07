### Exercise: Performing Rolling Updates and Rollbacks in Kubernetes

#### Objective

In this exercise, you will perform a rolling update to a Kubernetes Deployment and learn how to execute a rollback if needed.

#### Prerequisites

- Kubernetes cluster (e.g., [Docker Desktop with Kubernetes enabled](https://docs.docker.com/desktop/kubernetes/), [Minikube](https://minikube.sigs.k8s.io/docs/start/))
- [kubectl](https://kubernetes.io/docs/tasks/tools/) (included in Docker Desktop)
- A basic Deployment running in your cluster (refer to [previous exercises](../Exercise-Scaling/) for creating a Deployment).

#### Steps

1. **Create/Use an Existing Deployment**:
   Ensure you have a Deployment running in your cluster. If not, create a simple Deployment similar to previous exercises.

2. **Performing a Rolling Update**:
   Update the Deployment by changing the image or configuration. For example, updating an Nginx deployment to use a different version of the Nginx image.

   ```bash
   kubectl set image deployment/webapp-deployment webapp=nginx:1.17.1 --record
   ```

   This command updates the `webapp-deployment` to use the `nginx:1.17.1` image.

3. **Monitor the Rollout Status**:
   Check the status of the rollout. This step is crucial to ensure that the update is being rolled out as expected.

   ```bash
   kubectl rollout status deployment/webapp-deployment
   ```

4. **Verify the Update**:
   Once the rollout is complete, verify that the updated Pods are running the new version.

   ```bash
   kubectl get pods
   ```

5. **Check the Deployment History**:
   Check the history of the Deployment to see the rollout events.

   ```bash
   kubectl rollout history deployment/webapp-deployment
   ```

   You should see the rollout events for the update.

6. **Rollback if Necessary**:
   If you detect any issues with the new version, you can rollback to the previous version.

   ```bash
   kubectl rollout undo deployment/webapp-deployment
   ```

   This command reverts the Deployment to the previous stable version.

7. **Check Rollback Status**:
   Verify that the rollback was successful and the Pods are running the previous version.

   ```bash
   kubectl get pods
   ```

8. **Check the ReplicaSet**:
   Check the ReplicaSet to see the number of replicas for each version of the Deployment.

   ```bash
   kubectl get rs
   ```

9. **Clean Up**:
   After completing the exercise, delete the deployment to free up resources.

   ```bash
   kubectl delete -f webapp-deployment.yaml
   ```

#### Reflection

This exercise demonstrates the power of Kubernetes in managing application deployments and updates. It highlights the ability to update applications seamlessly with minimal downtime and provides a safety mechanism to revert changes if something goes wrong. Reflect on how these capabilities can be applied in continuous deployment scenarios and maintaining application stability.
