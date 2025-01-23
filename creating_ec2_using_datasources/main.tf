terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}
provider "aws" {
  # Configuration options
  region = "eu-north-1"
}
# ami (data source)
data "aws_ami" "name" {
  # searching on the basis of this
  most_recent = true
  owners      = ["amazon"]

}
# security group (data source)
data "aws_security_group" "name" {
  # searching on the basis of this
  tags = {
    mywebserver = "http"
  }
}
# vpc (data source)
data "aws_vpc" "name" {
  # searching on the basis of this
  tags = {
    ENV  = "PROD"
    Name = "my-vpc"
  }
}
# AZ
data "aws_availability_zones" "names" {
  # searching on the basis of this
  state = "available"
}
# to get the account details
data "aws_caller_identity" "name" {

}
# to get region
data "aws_region" "name" {

}
# to get subnet
data "aws_subnet" "name" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.name.id]
  }
  tags = {
    Name = "private-subnet"
  }
}
# creating aws ec2 instance
resource "aws_instance" "myserver" {
  ami             = data.aws_ami.name.id
  instance_type   = "<t3_micro_instance_type>"
  subnet_id       = data.aws_subnet.name.id
  security_groups = [data.aws_security_group.name.id]

  tags = {
    Name = "SampleServer"
  }
}
output "aws_ami" {
  value = data.aws_ami.name.id
}
output "security_group" {
  value = data.aws_security_group.name.id
}
output "vpc_id" {
  value = data.aws_vpc.name.id
}
output "aws_zones" {
  value = data.aws_availability_zones.names
}
output "caller_info" {
  value = data.aws_caller_identity.name
}
output "region_name" {
  value = data.aws_region.name
}
