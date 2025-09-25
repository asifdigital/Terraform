#Create a VPC named devops-vpc-t5q2 in us-east-1 region with 192.168.0.0/24 IPv4 CIDR using terraform.



resource "aws_vpc" "devops_vpc_t5q1" {
  cidr_block = "192.168.0.0/24 "
  tags = {
    Name = "devops-vpc-t5q2"
  }
}
