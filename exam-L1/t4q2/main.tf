#Create a public S3 bucket named devops-s3-2422-t4q2 using Terraform.
#Ensure the bucket is accessible publicly once created by setting the proper ACL.
#The Terraform working directory is /home/bob/terraform/t4q2.

resource "aws_s3_bucket" "devops_s3_2422_t4q2" {
  bucket = "devops-s3-2422-t4q2"

  tags = {
    Name        = "devops-s3-2422-t4q2"
 }
}

resource "aws_s3_bucket_acl" "public_acl" {
  bucket = aws_s3_bucket.devops_s3_2422_t4q2.id
  acl    = "public-read"    
  
}

resource "aws_s3_bucket_public_access_block" "allow_public_access" {
  bucket = aws_s3_bucket.devops_s3_2422_t4q2.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

