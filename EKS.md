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
   1.   Entity type: AWS Service <br> 
   2.   Select usecase as "EKS" -> Select EKS cluster <br>
   2.   RoleName: EKSClusterRole <br>
   2.   Click on CreateRole
 
- Create VPC using Cloud Formation using S3 URL.
   1.   https://s3.us-west-2.amazonaws.com/amazon-eks/cloudformation/2020-10-29/amazon-eks-vpc-private-subnets.yaml
   2.   Go to cloud formation in AWS service and click on create Stack.
   3.   Template source : Amazon S3 URL
   4.   Amazon S3 URL : Paste the above URL mentioned
   5.   StackName : EKSClusterVPC and click on Next button.
   6.   Tag : eks and key : cluster
   7.   Add IAM role to it which was created previously,
