## Elastic Kubernetes Service

- EKS stands for Elastic Kubernetes Service
- EKS is fully managed K8S service
- EKS is best place to run K8S applications because of its security , reliabilty and scalability.
- EKS can be integrated with other AWS service such as ELB, CloudWatch, AutoScaling, IAM and VPC.
- EKS makes it easy to run K8S without needing to install , operate and maintain own K8S control plane.
- AWS will have complete control over Control plane. we dont have control on Control plane.
- We need to create worker nodes and attach it to control plane.
Note : we will create worker nodes group using ASG group.

### Steps to create EKS Cluster in AWS

- Create IAM role <br>
     Entity type: AWS Service <br> 
     Select usecase as "EKS" -> Select EKS cluster <br>
     RoleName: EKSClusterRole <br>
     Click on CreateRole
