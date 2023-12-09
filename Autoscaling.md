## Auto-Scaling

- It is the process of increase/decrease of the infrastructure based on demand.
- It can be done using two ways.
- Vertical Autoscaling and horizontal autoscaling.
- Horizontal scaling - Increase the number of instances.
- Vertical scaling - Increase the capacity of the system.

1. Git clone repo <br>
$ git clone https://github.com/ashokitschool/k8s_metrics_server.git

2. Check the cloned repo <br>
$ cd k8s_metrics_server
$ ls deploy/1.8+/

3. Apply the manifest(yml) file from manifest-server directory <br>
$ kubectl apply -f deploy/1.8+/

4. $ kubectl get all -n kube-system

5. $ kubectl top nodes

6. $ kubectl top pods
