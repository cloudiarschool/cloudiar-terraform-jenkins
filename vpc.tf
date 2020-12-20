resource "aws_vpc" "cloudiar_vpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = var.tenancy

    tags = {
        Name = "Cloudiar-vpc-${terraform.workspace}"
    }
}

resource "aws_subnet" "cloudiar_subnet" {
    cidr_block = var.subnet_cidr
    vpc_id = aws_vpc.cloudiar_vpc.id

    tags = {
        Name = "Cloudiar-subnet-${terraform.workspace}"
    }
}