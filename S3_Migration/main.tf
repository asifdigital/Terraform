# Create a New Private S3 Bucket: Name the bucket devops-sync-13940 and store this bucket name in a variable named KKE_BUCKET.
# Data Migration: Migrate all data from the existing devops-s3-8735 bucket to the new devops-sync-13940 bucket.
# Ensure Data Consistency: Ensure that both buckets contain the same data after migration.
# Update the main.tf file (do not create a separate .tf file) to provision a new private S3 bucket and migrate the data.

# Use the variables.tf file with the following variable:
# KKE_BUCKET: The name for the new bucket created.

# Use the outputs.tf file with the following outputs:
# new_kke_bucket_name: The name of the new bucket created.
# new_kke_bucket_acl: The ACL of the new bucket created.

resource "aws_s3_bucket" "wordpress_bucket" {
  bucket = "devops-s3-8735"
}

resource "aws_s3_bucket_acl" "wordpress_bucket_acl" {
  bucket = aws_s3_bucket.wordpress_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket" "kke_bucket" {
  bucket = var.KKE_BUCKET
    tags = {
    Name        = var.KKE_BUCKET
  } 
}   

resource "aws_s3_bucket_acl" "kke_bucket_acl" {
  bucket = aws_s3_bucket.kke_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "kke_bucket_public_access_block" {
  bucket = aws_s3_bucket.kke_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  
}

resource "null_resource" "data_migration" {
  provisioner "local-exec" {
    command = "aws s3 sync s3://${aws_s3_bucket.wordpress_bucket.id} s3://${aws_s3_bucket.kke_bucket.id}"
  }
  depends_on = [
    aws_s3_bucket.kke_bucket, 
    aws_s3_bucket.wordpress_bucket]
}

