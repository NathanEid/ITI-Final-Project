variable "ec2_ami_id" {
}

variable "ec2_instance_type" {
}

variable "ec2_public_ip" {
}

variable "ec2_subnet_ip" {
}

variable "ec2_security_gr" {
}

variable "user_data" {
  default = <<-EOF

    #install docker
    sudo apt update -y
    sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - -y
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" -y
    apt-cache policy docker-ce
    sudo apt install docker-ce -y

    #install kubectl
    sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
    sudo echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    sudo chmod +x kubectl
    sudo mkdir -p ~/.local/bin
    sudo mv ./kubectl ~/.local/bin/kubectl

    #install aws cli
    sudo apt install unzip
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install

    sudo apt install vim -y
    sudo apt-get install -y openssh-server
    sudo apt-get install openjdk-11-jdk -y
  EOF
}

variable "ec2_name" {
}

variable "ec2_key_name" {
}