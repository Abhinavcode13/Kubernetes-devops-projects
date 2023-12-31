## Kubernetes monitoring 

### Prometheus (cluster monitoring)
- Prometheus is an open source systems monitoring and alerting toolkit.
- Prometheus collects and stores its metrics as time series data.
- It provide out of box monitoring capabilities for the K8S container orchestration platform.

### Grafana (cluster monitoring)

- Grafana is a database analysis and monitoring tool.
- Grafana is a multi-platform open source analytics and interactive vizualization web applications
- It provides chartss , grpahs and alert for the web apps when connected to supported data source.
- Grafana allows you to query , vizualize , alert on and understand your metricsno matter where they are stored.
- Create , explore and share dashboards

Note : Grafana weill connect to prometheus for data source.

## How to deploy Grafana & Prometheus in K8S

### Install Prometheus & Grafana

- Add the helm repo to K8S <br>
$ helm repo add stable https://charts.helm.sh/stable
- Update Helm repo <br>
$ helm repo update
- Search repo <br>
$ helm search repo prometheus-community
- Install helm <br>
$ helm install stable prometheus-community/kube-prometheus-stack
- Get all pods <br>
$ kubectl getpods
- Check the service <br>
$ kubectl get svc

- By deafult the service of prometheus and grafana is Cluster-IP , which can be accessed within the cluster so to access it outside the cluster we have to change the service to NodePort.

- Edit the prometheus service (Loadbalamcer) <br> 
kubectl edit svc stable-kube-prometheus-sta-prometheus
- Edit the grafana service (LoadBalancer) <br>
kubectl edit svc stable-grafana

## ELK Stack
- It is a collection of three open source products
  1. ElasticSearch - Used to store the logs
  2. Logstash - Used to process the logs
  3. Kibana - Used for visualization
- It allows to search all the log files in a single place.
- It provides a single logging in order to identify the problems with server or applications.

### Setup ELK stack

- $ kubectl create ns efk
- $ kubectl get ns
- $ helm ls
- $ helm repo add elastic https //helm.elastic.co
- $ helm repo ls
- $ curl -O https://raw.githubusercontent.com/elastic/helm-charts/master/elasticsearch/examples/minikube/values.yaml
- $ helm install elasticsearch elastic/elasticsearch -f ./values.yaml
- $ helm ls -n efk
- $ kubectl get all -n elk
- $ helm show values elastic/kibana >> kibana.values
- vi kibana.values
  1. Set replica to 1
  2. Change service type from Cluster-IP to LoadBalancer
  3. Change port to 80
- $ helm install kibana elastic/kibana -f kibana.values -n efk
- $ kubectl get all -n efk
- $ helm install filebeat elastic/filebeat -n efk 
- $ helm install metricbeat elastic/metricbeat -n efk
