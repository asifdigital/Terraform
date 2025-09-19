#The Elastic IP name datacenter-eip should be stored in a variable named KKE_eip.

resource "aws_eip" "KKE_eip" {
  domain = "vpc"  # Use this instead of deprecated '

  tags = {
    Name = var.KKE_eip   # Variable used here for the AWS resource name
  }
  
}