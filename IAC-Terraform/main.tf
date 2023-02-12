module "my_vpc" {
  source = "./vpc"
  vpc_cider = "10.0.0.0/16"
  vpc_name = "my_vpc"
}

module "internet_gateway" {
  source = "./internetgateway"
  internet_gw_name = "my_internet_gateway"
  internet_vpc_id = module.my_vpc.vpc_id
}

module "nat_gateway" {
  source = "./natgateway"
  nat_name = "my_nat_gateway"
  nat_subnet_id = module.public_subnet.subnet_id
  nat_depends_on = module.internet_gateway
}

module "security_group" {
  source = "./securitygroup"
  secgr_name = "security_group"
  secgr_description = "security_group"
  secgr_vpc_id = module.my_vpc.vpc_id
  secgr_from_port_in = 22
  secgr_to_port_in = 80
  secgr_protocol_in = "tcp"
  secgr_cider = ["0.0.0.0/0"]
  secgr_from_port_eg = 0
  secgr_to_port_eg = 0
  secgr_protocol_eg = "-1"
}

module "private_subnet_01" {
  source = "./subnet"
  subnet_cidr_block = "10.0.1.0/24"
  sub_availability_zone = "us-east-1a"
  subnet_name = "private_subnet_01"
  sub_vpc_id = module.my_vpc.vpc_id
}

module "private_subnet_02" {
  source = "./subnet"
  subnet_cidr_block = "10.0.2.0/24"
  sub_availability_zone = "us-east-1b"
  subnet_name = "private_subnet_02"
  sub_vpc_id = module.my_vpc.vpc_id
}

module "private_route_table" {
  source = "./routetable"
  table_name = "private_table"
  table_vpc_id = module.my_vpc.vpc_id
  table_destination_cidr_block = "0.0.0.0/0"
  table_gateway_id = module.nat_gateway.nat_gw_id
  table_subnet_id = { id1 = module.private_subnet_01.subnet_id, id2 = module.private_subnet_02.subnet_id }
  depends_on = [
    module.private_subnet_01.subnet_id,
    module.private_subnet_02.subnet_id
  ]
}

module "public_subnet" {
  source = "./subnet"
  subnet_cidr_block = "10.0.0.0/24"
  sub_availability_zone = "us-east-1a"
  subnet_name = "public_subnet"
  sub_vpc_id = module.my_vpc.vpc_id
}

module "public_route_table" {
  source = "./routetable"
  table_name = "public_table"
  table_vpc_id = module.my_vpc.vpc_id
  table_destination_cidr_block = "0.0.0.0/0"
  table_gateway_id = module.internet_gateway.internet_gw_id
  table_subnet_id = { id = module.public_subnet.subnet_id }
  depends_on = [
    module.public_subnet.subnet_id,
    module.private_subnet_01.subnet_id,
    module.private_subnet_02.subnet_id
  ]
}

module "eks" {
  source = "./eks"
  subnet_id_1 = module.private_subnet_01.subnet_id
  subnet_id_2 = module.private_subnet_02.subnet_id  
}
