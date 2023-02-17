resource "aws_route_table" "route_table" {
  vpc_id = var.table_vpc_id
  tags = {
    Name = var.table_name
  }
}

resource "aws_route" "route" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = var.table_destination_cidr_block
  gateway_id             = var.table_gateway_id
  depends_on             = [aws_route_table.route_table]
}

resource "aws_route_table_association" "subnet_association" {
  for_each  = var.table_subnet_id
  subnet_id = each.value
  # subnet_id = var.table_subnet_id
  route_table_id = aws_route_table.route_table.id
  depends_on     = [aws_route_table.route_table]
}