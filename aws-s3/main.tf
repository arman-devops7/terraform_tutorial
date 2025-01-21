terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
    random = {
      source  = "ContentSquare/random"
      version = "3.1.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
provider "random" {
  # Configuration options
}

resource "random_id" "rand_id" {
  byte_length = 8
}

# create s3 bucket
resource "aws_s3_bucket" "demo-bucket" {
  bucket = "unique_bucket_name-${random_id.rand_id.hex}"


}

# to upload file in s3 bucket
resource "aws_s3_object" "bucket-data" {
  bucket = aws_s3_bucket.demo-bucket
  source = "./my_file.txt"
  key    = "mydata.txt"
}



output "rand_id" {
  value = random_id.rand_id.hex
}

# terraform init
# terraform validate
# terraform apply
