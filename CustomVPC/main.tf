#Create a VPC named xfusion-vpc in us-east-1 region with 192.168.0.0/24 IPv4 CIDR using terraform.

resource "aws_vpc" "xfusion-vpc" {
    cidr_block = "192.168.0.0/24"
    tags = {
        Name = "xfusion-vpc"
    }
  
}