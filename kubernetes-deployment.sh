-> Deployment strategy are:
1. Recreate
2. Rolling Update
3. Blue/Green approach

-> Using deployment we can achieve auto-scaling



# K8S POD deployment manifest file(yml)

apiVersion: apps/v1
kind: Deployment
metadata: 
  name: javawebappdeployment
spec: 
 replicas: 1  
 strategy:
   type: Recreate
 selector:
   matchLabels:
    app: javawebapp
   template:
    metadata: javawebapppod
    labels:
     app: javawebapp
    spec:
     containers:
     - name: javawebappcontainer
     name: abhinavcode13/myfirstimage
     ports:
     - containerPort: 8080





apiVersion: v1
kind: Service
metadata: 
  name: javawebappsvc
spec:   
 type: NodePort
 selector:
  app: javawebapp
 ports:
  - port: 80
  targetPort: 8080
