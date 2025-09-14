# The name of the instance must be datacenter-ec2.
# Use the Amazon Linux ami-0c101f26f147fa7fd to launch this instance.
# The Instance type must be t2.micro.
# Create a new RSA key named datacenter-kp.
# Attach the default (available by default) security group.

data "aws_vpc" "default" {
    default = true
}

data "aws_security_group" "default" {
    name = "default"
    vpc_id = data.aws_vpc.default.id
    # filter {
    #     name   = "group-name"
    #     values = ["default"]
    # }       
    # filter {
    #     name   = "vpc-id"
    #     values = [data.aws_vpc.default.id]
    # }
  
}

#Generate a new RS private key
resource "tls_private_key" "datacenter-kp" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

#Create AWS key pair with the public key
resource "aws_key_pair" "datacenter-kp" {
  key_name   = "datacenter-kp"
  public_key = tls_private_key.datacenter-kp.public_key_openssh
  tags = {
    Name = "datacenter-kp"
  }
}

#Save the the private key to a file
resource "local_file" "datacenter-kp" {
  content  = tls_private_key.datacenter-kp.private_key_pem
  filename = "/home/bob/datacenter-kp.pem"
  file_permission = "0400"

}


resource "aws_instance" "datacenter-ec2" {
    ami           = "ami-0c101f26f147fa7fd"
    instance_type = "t2.micro"
    key_name      = "datacenter-kp"
    vpc_security_group_ids = [ data.aws_security_group.default.id ]

    tags = {
        Name = "datacenter-ec2"
    }

    depends_on = [ local_file.datacenter-kp ]
}