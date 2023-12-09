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
