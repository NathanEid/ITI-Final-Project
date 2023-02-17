# ITI-Final-Project

## Project Overview
  Deploy an application on Kubernetes cluster on AWS using CI/CD jenkins pipeline useing some steps to perform the project: Implement secure Kubernetes Cluster on AWS, Deploy and configure Jenkins on the cluster and Deploy the application on Kubernetes useing Jenkins pipeline.
  
* Infrastructure:
  - EKS
  - EC2 to be used as manged node for ansible and slave node for jenkins
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
  - Ansible
  
* Get Started:
  - Build Infrastructure:
    - if you have jenkins server you can connect to the repo and make a pipeline to deploy the infrastructure by the located Jenkinsfile, if not follow the following commands..
    
    - Clone the repo:
      ```
      git clone https://github.com/NathanEid/ITI-Final-Project.git
      ```
    - Terraform Commands:
      ```
      cd IAC-Terraform
      terraform init
      terraform apply
      ```
  - Deploy jenkins with two options:
    - Deploy jenkins using ansible playbook by the maneged node, after configre the manged node with the controle plain (local) and install our dependencies: aws-cli, kubectl, openssh, config users and config key, we can run the below command
      ```
      ansible-playbook ansible-playbook.yml
      ```
      
    - Deploy jenkins without ansible by run this commands on our local
      - Access EKS cluster from local
      ```
      aws eks --region <your-region> update-kubeconfig --name <cluster-name> --profile <aws-profile>
      ```
      - Deploy jenkins deployment files
      ```
      cd Jenkins-Deployment
      kubectl apply -f .
      ```
  - Access jenkins from the browser
    ```
    kubectl get svc -n jenkins
    ```
    ![image](https://user-images.githubusercontent.com/40915944/219476295-e155e2dd-6534-49e7-ace2-e4098af51e73.png)
  
  - Deploy Kubernetes Plugin on jenkins and connect to the cluster
  
    ![image](https://user-images.githubusercontent.com/40915944/219478062-52abf14f-30d8-42da-bd0d-0e8681f0a879.png)
  
  - Configure jenkins slave ec2 to run docker and kubernetes commands
  
    ![image](https://user-images.githubusercontent.com/40915944/219704717-79e51d55-1dc6-494a-b150-c9c33c093830.png)
    ![image](https://user-images.githubusercontent.com/40915944/219704935-2e66776a-1d89-4e82-b9ca-11d176bb365b.png)
    ![image](https://user-images.githubusercontent.com/40915944/219704600-9fcda60f-97fa-41cd-b2fb-aee51c6fea63.png)

  - Create pipeline and deploy the app
  
    ![image](https://user-images.githubusercontent.com/40915944/219480079-2beaaaa6-1edf-4307-9099-70b156352fba.png)
    ![image](https://user-images.githubusercontent.com/40915944/219705401-2b4a3b85-cbac-4b11-b932-5c12028233dd.png)
    ![image](https://user-images.githubusercontent.com/40915944/219705463-8827491e-a4ad-4282-a9d2-6b4e94bf65f2.png)
    ![image](https://user-images.githubusercontent.com/40915944/219705557-54f33f78-9fd8-4aaf-a72a-f2a5ceac2839.png)
    
  - Get the app url
    ```
    kubectl get svc -n app
    ```
    ![image](https://user-images.githubusercontent.com/40915944/219480413-9e22f9be-95ec-4053-9fa5-5cd245b87554.png)
