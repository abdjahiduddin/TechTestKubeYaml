
# Yaml File for Deployment to Kubernetes - Technical Test

Repositori ini berisi YAML script untuk menjalakan API User CRUD dan User Login di Cluster Kubernetes.




## Tech Stack

**Backend:** Node, Express

**Database:** MongoDB

**Cloud:** Google Compute Engine

**Container :** Docker

**Container Orchestration:** Kubernetes



## Important Link

 - [Submission Document](https://jahiduddin.notion.site/Deall-Backend-Engineer-Test-cfa2d5277eea4483b99c8e4228fff44f)
 - [API Documentation](https://documenter.getpostman.com/view/3903208/2s8YzXteda)
 - [Repository API User CRUD](https://github.com/abdjahiduddin/TechTestMicroserviceUsers)
 - [Repository API User Login](https://github.com/abdjahiduddin/TechTestMicroserviceUserLogin)


## YAML Files Description
#### root directory 
- app-secrets.yaml : Membuat resources secrets untuk menyimpan jwt secret yang digunakan untuk membuat JWT Token dan Verifikasi Token.
- ingress.yaml : Membuat resources ingress untuk mengarahkan traffic sesuai path.
- namespaces.yaml : Membuat resources namespaces tech-test. Semua resources Kubernetes yang digunakan pada project ini dikelompokkan ke dalam namespaces tech-test.
 
#### mongo directory
- mongo-init.js : Source code javascript untuk membuat user baru pada MongoDB. File JS ini akan dijalankan pada saat melakukan build image MongoDB.
- Dockerfile : Build docker image MongoDB yang memiliki 1 user root dan 1 user untuk mengakses database. 
- mongo-deployment.yaml : Membuat resources deployment untuk menjalankan image MongoDB pada Pod dan memastikan akan selalu ada 1 Pod yang berjalan.
- mongo-pv-pvc.yaml : Menyediakan persistent volume untuk MongoDB dengan menggunakan Persisten Volume dan Persisten Volume Claim.
- mongo-service.yaml : Mengekspos Pod MongoDB dengan type ClusterIP.

#### user-login directory
- login-deployment.yaml : Membuat resources deployment untuk menjalankan docker image API User Login pada Pod dan memastikan akan selalu ada 1 Pod yang berjalan.
- login-service.yaml : Mengekspos Pod API User Login dengan type ClusterIP.

#### users directory
- user-deployment.yaml : Membuat resources deployment untuk menjalankan docker image API User CRUD pada Pod dan memastikan akan selalu ada 1 Pod yang berjalan.
- user-service.yaml : Mengekspos Pod API User CRUD dengan type ClusterIP.