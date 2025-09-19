#S3 bucket named devops-cp-3993 already exists. 
#Copy the file /tmp/devops.txt to s3 bucket devops-cp-3993 using Terraform.

resource "aws_s3_bucket" "devops-cp-3993" { 
  bucket = "devops-cp-3993"

  tags = {
    Name        = "devops-cp-3993"
  }  
    
}

resource "aws_s3_object" "file_copy" {
  bucket = aws_s3_bucket.devops-cp-3993.id
  key    = "devops.txt"
  source = "/tmp/devops.txt"
}
