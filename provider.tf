provider "aws" {
    region = var.region
}

terraform {
    backend "s3" {
        bucket = "mysql-docker-bakcup"
        key = "terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "sunday-tf"
    }
}