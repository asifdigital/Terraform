resource "aws_s3_bucket" "s3_ran_bucket" {
  bucket = "devops-s3-19413"


  tags = {
    Name        = "devops-s3-19413"
  }
}

resource "aws_s3_bucket_public_access_block" "private_s3" {
  bucket = aws_s3_bucket.s3_ran_bucket.id 

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "devops-s3-versioning" {
    bucket = aws_s3_bucket.s3_ran_bucket.id
    versioning_configuration {
        status = "Enabled"
    }
}