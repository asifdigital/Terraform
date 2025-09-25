#Create an S3 bucket using Terraform with the following details:
#1) The name of the S3 bucket must be devops-s3-2422-t4q1.
#2) The S3 bucket must block all public access, making it a private bucket.
#The Terraform working directory is /home/bob/terraform/t4q1


resource "aws_s3_bucket" "devops_s3_2422_t4q1" {
  bucket = "devops-s3-2422-t4q1"

  tags = {
    Name        = "devops-s3-2422-t4q1"
 }
}   

resource "aws_s3_bucket_acl" "private_acl" {
  bucket = aws_s3_bucket.devops_s3_2422_t4q1.id
  acl    = "private"
  
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.devops_s3_2422_t4q1.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
