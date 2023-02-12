resource "aws_security_group" "security_gr" {
  name        = var.secgr_name
  description = var.secgr_description
  vpc_id      = var.secgr_vpc_id

  ingress {
    from_port        = var.secgr_from_port_in
    to_port          = var.secgr_to_port_in
    protocol         = var.secgr_protocol_in
    cidr_blocks      = var.secgr_cider
  }

  egress {
    from_port        = var.secgr_from_port_eg
    to_port          = var.secgr_to_port_eg
    protocol         = var.secgr_protocol_eg
    cidr_blocks      = var.secgr_cider
  }

  tags = {
    Name = var.secgr_name
  }
}
