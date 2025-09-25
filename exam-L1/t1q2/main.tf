#For this task, create an EC2 instance using Terraform with the following requirements:
#The name of the instance must be devops-ec2-t1q2.
#Use the Amazon Linux ami-0c101f26f147fa7fd to launch this instance.
#The Instance type must be t2.micro.
#Create a new RSA key named devops-kp-t1q2.
#Attach the default (available by default) security group.

data "aws_vpc" "default" {
    default = true
  
}

data "aws_security_group" "default" {
    name = "default"
    vpc_id = data.aws_vpc.default.id
  
}

resource "tls_private_key" "devops_kp_t1q2" {
  algorithm = "RSA"
  rsa_bits  = 2048
  
}

resource "aws_key_pair" "devops_kp_t1q2" {
  key_name   = "devops-kp-t1q2"
  public_key = tls_private_key.devops_kp_t1q2.public_key_openssh         
  
}

resource "local_file" "devops_kp_t1q2" {
  content  = tls_private_key.devops_kp_t1q2.private_key_pem
  filename = "/home/bob/devops-kp-t1q2.pem"
  file_permission = "0400"         
}


resource "aws_instance" "devops_ec2_t1q2" {
  instance_type = "t2.micro"
  ami           = "ami-0c101f26f147fa7fd"
  key_name      = aws_key_pair.devops_kp_t1q2.key_name
  vpc_security_group_ids = [ data.aws_security_group.default.id ]

      tags = {
        Name = "devops-ec2-t1q2"
    }       
  
}

