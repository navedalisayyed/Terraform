resource "aws_s3_bucket" "my-bucket" {
    bucket = local.bucket-name
    acl = "private"
    tags = {
      Name = local.bucket-name
      Environment = var.environment-name
    }

  
}

# Define Locals

locals {

    bucket-name = "${var.app-name}-${var.environment-name}-bucket"

  
}