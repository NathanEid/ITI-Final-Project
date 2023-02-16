pipeline {
    agent any   
    stages {
        stage('CI') {
            steps {
                git 'https://github.com/NathanEid/ITI-Final-Project.git'
            }
        }
        stage('CD') {
            steps {
                sh "cd IAC-Terraform"
                sh "terraform init"
                sh "terraform apply -auto-approve"
            }
        }    
    }
}