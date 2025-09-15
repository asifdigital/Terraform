#For this task, create an AWS EBS volume using Terraform with the following requirements:
#Name of the volume should be nautilus-volume.
#Volume type must be gp3.
#Volume size must be 2 GiB.
#Ensure the volume is created in us-east-1.

resource "aws_ebs_volume" "nautilus-volume" {
  availability_zone = "us-east-1a"
  size              = 2
  type              = "gp3"

  tags = {
    Name = "nautilus-volume"
  }
}

