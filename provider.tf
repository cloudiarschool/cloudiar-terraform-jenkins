provider "aws" {
    region = var.region
}

terraform {
    backend "s3" {
        bucket = "cloudiartest123"
        key = "terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "fatih-table"
    }
}