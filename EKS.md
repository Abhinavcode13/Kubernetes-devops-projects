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
 
- Create EKS Cluster using the VPC service
   1.   Create cluster and ClusterNmae: EKSCluster
   2.   Kubernetes verison : 1.22
   3.   Cluster service role: Select IAM which was created earlier and click on next button.
   4.   VPC: choose a default or custom VPC and select Security group.
   5.   IP address : IPv4 and endpoint access : Public and Private and click on next button.
   6.   Create a EKS cluster can take upto 5-10 mins.
 
- Create a Redhat EC2 instance
   1.   This instance will act as a remote machine to communicate with EKS cluster.
   2.   Install Kubectl in this ec2 instance using the below commands:
   3.   $ curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
   4.   $ sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
   5.   $ kubectl version --client
   6.   Install AWS CLI using the below commands:
   7.   $ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
   8.   $ sudo yum install curl
   9.   $ unzip awscliv2.zip
   10.  $ sudo ./aws/install
   11.  $ aws --version

- Configure AWS Crendentails
   1.   $ aws configure
   2.   Create access key having access key id and secret key.
   3.   aws eks list-clusters
   4.   Update kubeconfig file to kubectl remote machine using below command:
   5.   aws eks update-kubeconfig --name cluster-name --region ap-south-1
 
- Create IAM role for worker nodes
   1.   Create a EC2 instance for the worker nodes in IAM role having below policies:
   2.   AmazonEKSWorkerNodePolicy
   3.   AmazonEKS_CNI_Policy
   4.   AmazonEC2ContainerRegistryReadOnly
   5.   Rolename: EKSworkernoderole -> Create role
   6.   Go to EKS cluster -> Go to compute -> Add node group
   7.   Select the IAM role created.
   8.   Desired size: 2
   9.   Minimum size: 2
   10.  Maximum size: 3
   11.  It will take 4 subnets and then enable configure SSH access to the nodes.
   12.  Select key-pair -> create node group.
   13.  Create a POD and expose the POD using NodePort service.
