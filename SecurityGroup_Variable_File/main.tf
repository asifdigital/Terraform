#For this task, create an AWS Security Group using Terraform with the following requirements:
#The Security Group name datacenter-sg should be stored in a variable named KKE_sg.
#Note:
#1. The configuration values should be stored in a variables.tf file.
#2. The Terraform script should be structured with a main.tf file referencing variables.tf.

data "aws_vpc" "default" {
  default = true
}
resource "aws_security_group" "KKE_sg" {
   name        = var.KKE_sg    
  description = "Security group for datacenter"
  vpc_id      = data.aws_vpc.default.id

ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all inbound traffic"
  }

# Egress rule (optional but recommended)
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }


}
