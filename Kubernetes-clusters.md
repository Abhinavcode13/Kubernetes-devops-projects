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
