#Create a public S3 bucket named datacenter-s3-17944 using Terraform.
#Ensure the bucket is accessible publicly once created by setting the proper ACL.


resource "aws_s3_bucket" "datacenter-s3-17944" {
  bucket = "datacenter-s3-17944"
  tags = {
    Name        = "datacenter-s3-17944"
  } 
  
}

resource "aws_s3_bucket_public_access_block" "datacenter-s3-17944" {
  bucket = aws_s3_bucket.datacenter-s3-17944.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}   

# Attach a bucket policy that makes objects publicly readable
resource "aws_s3_bucket_policy" "datacenter-s3-17944-policy" {
  bucket = aws_s3_bucket.datacenter-s3-17944.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.datacenter-s3-17944.arn}/*"
      }
    ]
  })
  
}