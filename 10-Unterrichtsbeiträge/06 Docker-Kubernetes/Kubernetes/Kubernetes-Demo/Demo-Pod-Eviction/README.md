### Demo: Kubernetes Pod Eviction

#### Steps

1. **Deploy the Application**:
   Apply the Deployment configuration to your Kubernetes cluster.

   ```bash
   kubectl apply -f webapp-deployment.yaml
   ```

2. **Verify the Deployment**:
   Check the status of the newly created Deployment.

   ```bash
   kubectl get deployments
   kubectl get pods -o wide
   kubectl get node
   ```

   You should see `webapp-deployment` with 6 replicas. If multiple nodes are available, the pods will be distributed across the nodes.

3. **Drain a Node**:
   Drain a node to simulate a node failure.

   ```bash
   kubectl drain <node-name> --ignore-daemonsets
   ```

   This command will evict all the pods from the node. The pods will be rescheduled on other nodes.

   Alternatively, you can shutdown nodes or disable their internet connection to simulate a node failure. Kubernetes will detect node failures and reschedule the pods on other nodes once an eviction threshold has passed. This can take a few minutes.

4. **Check the Pods**:
   Check the status of the pods.

   ```bash
   kubectl get pods -o wide
   ```

   You should see the pods running on other nodes.

5. **Uncordon the Node**:
   Uncordon the node to allow pods to be scheduled on it again.

   ```bash
   kubectl uncordon <node-name>
   ```

6. **Cleanup**
   Delete the deployment once you are done.

   ```bash
   kubectl delete -f webapp-deployment.yaml
   ```
