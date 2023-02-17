resource "aws_instance" "ec2_instance" {
  ami             = var.ec2_ami_id
  instance_type   = var.ec2_instance_type
  associate_public_ip_address = var.ec2_public_ip
  subnet_id       = var.ec2_subnet_ip
  vpc_security_group_ids = var.ec2_security_gr
  key_name = var.ec2_key_name
  user_data = var.user_data
  tags = {
    Name = var.ec2_name
  }

}
