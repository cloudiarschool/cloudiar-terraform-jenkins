resource "aws_vpc" "cloudiar_vpc" {
    cidr_block = 
    instance_tenancy = 

    tags = {
        Name = "Cloudiar-vpc-${terraform.workspace}"
    }
}