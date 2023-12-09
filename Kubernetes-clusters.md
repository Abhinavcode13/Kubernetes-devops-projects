# Kubernetes Cluster Setup

There are two main ways to set up a Kubernetes cluster: self-managed and managed.

## Self-Managed Cluster

### Tools Used
- `kubeadm`
- `minikube`

### Steps
1. Install `kubeadm` on your servers or nodes.
2. Use `kubeadm` to initialize the control plane.
3. Set up worker nodes using `kubeadm join`.
4. Install `minikube` to set up a single-node Kubernetes cluster for development purposes.

## Managed Kubernetes Cluster

A managed Kubernetes cluster is set up and maintained by a cloud provider or a third-party service. Examples include:
- Google Kubernetes Engine (GKE)
- Amazon EKS
- Microsoft Azure Kubernetes Service (AKS)

## Kubernetes cluster setup

- Create one security group with protocol as "All traffic" port range as `0-65535`
- Create 3 ubuntu server using above created security group
- Master node `(t2.medium instance)`
- Worker node `(t2.micro instance)`

## Common commands for master-slave nodes

- sudo apt-get `update`
- sudo apt-get `install` docker.io
- docker `--version`
- sudo usermod -aG docker `$USER`
- sudo systemctl `start` docker
- sudo systemctl `enable` docker

## Installing kubernetes

- sudo apt `install` curl
- curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/kubernetes.gpg
- echo "deb [arch=amd64 signed-by=/usr/share/keyrings/kubernetes.gpg] http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list
- sudo apt `install kubeadm` kubelet kubectl kubernetes-cni
- sudo apt-mark hold `kubeadm` kubelet kubectl kubernetes-cni
- kubeadm `version`
- sudo swapoff -a
- sudo systemctl `deamon-reload`
- sudo systemctl `start` kubelet
- sudo systemctl `enable` kubelet.service

## Kubernetes master node commands
- sudo kubeadm init
- mkdir -p $HOME/.kube
- sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
- sudo chown $(id -u):$(id -g) $HOME/.kube/config
- kubectl get nodes
- kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/tigera-operator.yaml
- curl https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/custom-resources.yaml -O
- kubeadm token create --print-join-command

## Kubectl installation

- Launch a new EC-2 Vm instance
- curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
- chmod +x kubectl
- mkdir -p ~/.local/bin
- mv ./kubectl ~/.local/bin/kubectl
- kubectl version
- mkdir ~/.kube
- cat ~/.kube/config `Take kube config file from master node and keep it here.`
- vi ~/.kube/config
- kubectl cluster-info
- kubectl get node

## Kubernetes core components
- Container
- POD
- Namespace
- Service
- Deployment
- ReplicationController
- ReplicationSet
- DaemonsSets
- PersistentVolumes
- SatefulSets
- Role
- Secret Config Maps

## Namespaces in kubernetes
- Namespace represent a cluster inside another cluster
- kubernetes components will be grouped logically using namepsace
- kubectl get `namespace` (To fetch all the namespaces)
- 3 Default namespace - Default, kube-system, kube-public
- To get our own namespace - kubectl `create` namespace namespace-name

## POD
- POD is the smallest building block which we can execute inside a K8S cluster
- POD can have one conatiner or more than one container
- POD will execute in a node
- One node can execute multiple POD
- POD represents running container
- Conatiners running inside the pod will share a unique network , storage and other specifications.
- To run docker image we have to create a pod then K8S will execute the pod

### How to create a POD
1. Interactive
- Creating `POD` using commands Ex : `kubectl` run --name javawebapppod `--image=abhinavcode13/javawebapp`
2. Declarative
- Creating `POD` using `YML` file
- apiVersion: version of the api ex: v1, v2
- kind: what is the purpose this manifest file
- metadata: represents labels
- spec: represents specifications

### Simple pod.yml file

```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx:1.14.2
    ports:
    - containerPort: 80
```
- $ Kubectl `apply` -f simple.yml
- Description of the POD : kubectl `describe` pod simple.yml

- Access POD using the POD ip
- curl poid-ip:8080
- We can not access pod using pod ip outside the cluster

### POD lifecycle
- Make a request to `API` server using manifest file(YML) to create a pod.
- API server will save the pod info in `ETCD`.
- `Scheduler` find the un scheduled pod info and schedule the pod for execution in NODE.
- `kubelet` will see that pod execution schedule and trigger the `docker runtime`.
- Dokcer runtime will run the container in the POD.
- Pod is `ephemeral` and live for `short period` of time.
- When the pod is `recreated` its `POD` id will change
- So we use `kubernetes Service` component to run the PODS's
- K8S service make the pod accessible outside and inside the cluster/network.

### K8S Service
- K8S service make the pod accessible outside and inside the cluster/network using NODEPORT Service.
- Service will identify the pod using the POD label.
```
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app.kubernetes.io/name: MyApp
  ports:
    - protocol: TCP
      port: 80
      targetPort: 937
```
- To display the service : kubectl get svc
- Range of NODEPORT service in K8S cluster is 30000-32767
