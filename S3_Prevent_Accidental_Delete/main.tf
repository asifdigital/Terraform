# Create an S3 bucket named devops-s3-17609.
# Apply the prevent_destroy lifecycle rule to protect the bucket.

# Create the main.tf file (do not create a separate .tf file) to provision a s3 bucket with prevent_destroy lifecycle rule.

# Use the variables.tf file with the following:
# KKE_BUCKET_NAME: name of the bucket.
# Use the terraform.tfvars file to input the name of the bucket.

# Use the outputs.tffile with the following:
# s3_bucket_name: name of the created bucket.

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.KKE_BUCKET_NAME
  
  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = var.KKE_BUCKET_NAME
  }
}

