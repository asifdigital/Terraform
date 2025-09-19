#For this task, create an AWS VPC using Terraform with the following requirements:

#The VPC name nautilus-vpc should be stored in a variable named KKE_vpc.
#The VPC should have a CIDR block of 10.0.0.0/16.
#Note:
#The configuration values should be stored in a variables.tf file.
#The Terraform script should be structured with a main.tf file referencing variables.tf 

resource "aws_vpc" "KKE_vpc" {
 
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = var.KKE_vpc
   }
}
