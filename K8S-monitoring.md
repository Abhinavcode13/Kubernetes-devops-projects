## Kubernetes monitoring

### Prometheus
- Prometheus is an open source systems monitoring and alerting toolkit.
- Prometheus collects and stores its metrics as time series data.
- It provide out of box monitoring capabilities for the K8S container orchestration platform.

### Grafana 

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
