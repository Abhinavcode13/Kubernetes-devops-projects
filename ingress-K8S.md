- Clone the repo
  1. $ git clone https://github.com/ashokitschool/kubernetes_ingress
  2. $ cd kubernetes-ingress
  3. $ kubectl apply -f common/ns-and-sa.yaml
  4. $ cat common/ns-and-sa.yaml

- Create RBAC and ConfigMap
  1. $ kubectl apply -f common/
 
- Ingress can be deployed in two different ways:
  1. Deployment
  2. DaemonSet
  3. $ kubectl apply -f daemon-set/ngnix-ingress.yaml
  4. $ kubectl apply -f service/loadbalancer-aws-elb.yaml
  5. It will generate a LBR DNS
  6. Map LBR dns to Route 53 domain
  
