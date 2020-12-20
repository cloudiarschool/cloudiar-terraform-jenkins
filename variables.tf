variable "region" {
    default = "us-east-1"
}

variable "vpc_cidr" {
    default = "10.20.0.0/16"
}

variable "subnet_cidr" {
    default = "10.20.1.0/24"
}

variable "tenancy" {
    default = "default"
}