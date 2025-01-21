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
  region = var.region
}


# karna ky h?
resource "aws_instance" "web01" {
  ami           = "<ami_id>"
  instance_type = "<t3_micro_instance_type>"

  # optional
  tags = {
    Name = "web01"
  }
}


# to initialize terraform use this command
# terraform init

# terraform plan (disolayes the information what chngs will be done)
# terraform apply 
# terraform destroy  (to del the resource/instance)
# teraform validate (to check the file if it is correct or not)

# Terraform Output
