# Pod manifest(yml)

# Replication controller concept of pods in Kubenetes

apiVersion: v1
kind: ReplicationController
metadata: 
  name: javawebapprc
spec:
  replicas: 1
  selector: 
     app: javawebapp
     template:
     metadata:
        name: javawebapppod
        labels:
          app: javawebapp
     spec:
       conatiners:
       - name: javawebappcontainer
         image: abhinavcode13/myfirstimage
         ports:
         - containerPort: 8080

         
#  Service manifest(yml)

apiVersion: v1
kind: Service
metadata: 
  name: javawebappsvc
spec: 
  type: NodePort
  selector:
    app: javawebapp


+++++++++++++++++++++++++++++++++++++++++++++++++++++++

# ReplicaSet concept of pods in Kubenetes

apiVersion: v1
kind: ReplicationController
metadata: 
  name: javawebapprc
spec:
  replicas: 1
  selector: 
     matchedLabels:
        app: javawebapp
     template:
     metadata:
        name: javawebapppod
        labels:
          app: javawebapp
     spec:
       conatiners:
       - name: javawebappcontainer
         image: abhinavcode13/myfirstimage
         ports:
         - containerPort: 8080

         
#  Service manifest(yml)

apiVersion: v1
kind: Service
metadata: 
  name: javawebappsvc
spec: 
  type: NodePort
  selector:
    app: javawebapp
  ports:
    -  port: 80
    targetPort: 8080    
  ports:
    -  port: 80
    targetPort: 8080


+++++++++++++++++++++++++++++++++++++++++++++++++++++++

#DeamonSet concept for pods in kubernetes

-> A DaemonSet ensures that all (or some) Nodes run a copy of a Pod. 
-> As nodes are added to the cluster, Pods are added to them. As nodes are removed from the cluster, those Pods are garbage collected. 
-> Deleting a DaemonSet will clean up the Pods it created.

Some typical uses of a DaemonSet are:

1. running a cluster storage daemon on every node
2. running a logs collection daemon on every node
3. running a node monitoring daemon on every node
