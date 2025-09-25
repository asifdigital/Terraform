#Create an EC2 instance named datacenter-ec2 using any Linux AMI like Ubuntu.
#Instance type must be t2.micro and associate 
#an Elastic IP address named datacenter-eip with this instance.
#Use the main.tf file (do not create a separate .tf file) to provision the EC2-Instance and Elastic IP.
#Use the outputs.tf file and output the instance name using variable KKE_instance_name and the Elastic IP using variable KKE_eip.
#Notes:
#The Terraform working directory is /home/bob/terraform.

data "aws_vpc" "default" {
    default = true  
}

data "aws_security_group" "default" {
    name = "default"
    vpc_id = data.aws_vpc.default.id  
}

resource "tls_private_key" "ec2_privatekey" {
    algorithm = "RSA"
    rsa_bits  = 4096
  
}

resource "aws_key_pair" "ec2_keypair" {
  key_name   = "ec2-keypair"
  public_key = tls_private_key.ec2_privatekey.public_key_openssh
}

resource "local_file" "ec2_key_file" {
  content  = tls_private_key.ec2_privatekey.private_key_pem
  filename = "/home/bob/terraform/ec2-keypair.pem"
  file_permission = "0600"
  
}

resource "aws_instance" "ec2_instance" {
  ami           = local.AMI_ID
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ec2_keypair.key_name
  vpc_security_group_ids = [ data.aws_security_group.default.id ]

  tags = {
    Name = var.KKE_instance_name
  }
  
}

resource "aws_eip" "ec2_eip" {
  instance = aws_instance.ec2_instance.id
  domain = "vpc"

  tags = {
    Name = var.KKE_eip
  } 
  
  depends_on = [ aws_instance.ec2_instance ]

}

resource "aws_eip_association" "ec2_eip_assoc" {
  instance_id   = aws_instance.ec2_instance.id
  allocation_id = aws_eip.ec2_eip.id
  
}
