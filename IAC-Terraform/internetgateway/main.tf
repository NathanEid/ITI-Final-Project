resource "aws_internet_gateway" "internet_gw" {
  vpc_id = var.internet_vpc_id
  tags = {
    Name = var.internet_gw_name
  }
}
