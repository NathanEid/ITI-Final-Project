resource "aws_subnet" "subnet" {
    cidr_block = var.subnet_cidr_block
    vpc_id = var.sub_vpc_id
    availability_zone = var.sub_availability_zone
    tags = {
        Name = var.subnet_name
    }
}