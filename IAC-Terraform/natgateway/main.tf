resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.lb.id
  subnet_id     = var.nat_subnet_id

  tags = {
    Name = var.nat_name
  }

  depends_on = [ var.nat_depends_on ]
}

##### Elistic IP
resource "aws_eip" "lb" {
}
