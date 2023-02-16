# ITI-Final-Project

## Project Overview
  Deploy an application on Kubernetes cluster on AWS using CI/CD jenkins pipeline useing some steps to perform the project: Implement secure Kubernetes Cluster on AWS, Deploy and configure Jenkins on the cluster and Deploy the application on Kubernetes useing Jenkins pipeline.
  
* Infrastructure:
  - EKS
  - Vpc
  - 2 Subnet Private for EKS
  - 1 Subnet Public for nat gateway
  - 1 Nat gateway
  - 1 Elistic IP
  - 1 Internet gateway
  - 2 Routes tables for public and private routes
  - 1 ٍSecurity group
  
* Tools:
  - Terraform
  - AWS
  - Kubernetes
  - Docker
  - Jenkins
  
* Get Started:
  - clone the repo
      ```
      git clone https://github.com/NathanEid/ITI-Final-Project.git
      ```
  - build infrasturcture
    ```
    cd IAC-Terraform
    terraform init
    terraform apply
    ```
  - access EKS cluster from local
    ```
    aws eks --region <your-region> update-kubeconfig --name <cluster-name> --profile <aws-profile>
    ```
  - deploy jenkins from yaml files
    ```
    cd Jenkins-Deployment
    kubectl apply -f .
    ```
  - access jenkins from the browser
    ```
    kubectl get svc -n jenkins
    ```
    ![image](https://user-images.githubusercontent.com/40915944/219476295-e155e2dd-6534-49e7-ace2-e4098af51e73.png)
  
  - deploy Kubernetes Plugin on jenkins and connect to the cluster
    ![image](https://user-images.githubusercontent.com/40915944/219478062-52abf14f-30d8-42da-bd0d-0e8681f0a879.png)

  - create pipeline and deploy the app
    ![image](https://user-images.githubusercontent.com/40915944/219480079-2beaaaa6-1edf-4307-9099-70b156352fba.png)
    ![image](https://user-images.githubusercontent.com/40915944/219480197-1637665f-b5d1-496d-bea1-3eeb3b8ad149.png)
    ![image](https://user-images.githubusercontent.com/40915944/219480315-75a19713-2074-4250-aa70-e267b6ddccaa.png)
    
  - get the app url
    ```
    kubectl get svc -n app
    ```
    ![image](https://user-images.githubusercontent.com/40915944/219480413-9e22f9be-95ec-4053-9fa5-5cd245b87554.png)
    
