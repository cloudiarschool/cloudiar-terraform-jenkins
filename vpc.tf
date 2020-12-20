resource "aws_vpc" "cloudiar_vpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = var.tenancy

    tags = {
        Name = "Cloudiar-vpc-${terraform.workspace}"
    }
}