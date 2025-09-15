#Create an S3 bucket using Terraform with the following details:
#1) The name of the S3 bucket must be datacenter-s3-21775.
#2) The S3 bucket must block all public access, making it a private bucket.

resource "aws_s3_bucket" "datacenter-s3-17944" {
  bucket = "datacenter-s3-21775"  # Name of the S3 bucket
  # Removed deprecated 'acl' argument. Public access will be blocked using aws_s3_bucket_public_access_block.
}

resource "aws_s3_bucket_public_access_block" "datacenter-s3-17944" {
  bucket = aws_s3_bucket.datacenter-s3-17944.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

