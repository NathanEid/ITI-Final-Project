output "nat_gw_id" {
  value = aws_nat_gateway.nat_gateway.id
}

output "elistic_ip" {
  value = aws_eip.lb.id
}