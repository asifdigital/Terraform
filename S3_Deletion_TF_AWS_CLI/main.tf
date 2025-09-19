#A S3 bucket named nautilus-bck-2124 already exists.
#1) Copy the contents of nautilus-bck-2124 S3 bucket to /opt/s3-backup/ directory on 
#terraform-client host (the landing host once you load this lab).
#2) Delete the S3 bucket nautilus-bck-2124.
#3) Use the AWS CLI through Terraform to accomplish this task—for example, 
#by running AWS CLI commands within Terraform. 

resource "null_resource" "copy_from_s3" {
  provisioner "local-exec" {
    command = "aws s3 sync s3://nautilus-bck-2124 /opt/s3-backup/"
  }
}

resource "null_resource" "delete_s3_bucket" {
    provisioner "local-exec" {
        command = "aws s3 rb s3://nautilus-bck-2124 --force"
    }
    depends_on = [null_resource.copy_from_s3]
}   