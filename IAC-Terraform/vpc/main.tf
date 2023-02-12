resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cider
  tags = {
    Name = var.vpc_name
  }
}