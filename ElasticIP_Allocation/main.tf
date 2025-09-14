#For this task, allocate an Elastic IP address named datacenter-eip using Terraform.

resource "aws_eip" "datacenter-eip" {
    domain = "vpc"
    tags = {
        Name = "datacenter-eip"
    }
}