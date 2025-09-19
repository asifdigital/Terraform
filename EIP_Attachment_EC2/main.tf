#There is an instance named devops-ec2 and an elastic-ip named devops-ec2-eip in us-east-1 region.
# Attach the devops-ec2-eip elastic-ip to the devops-ec2 instance

# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  subnet_id     = "subnet-ab0f8d569fb28307d"
  vpc_security_group_ids = [
    "sg-83b7176d56172a41c"
  ]

  tags = {
    Name = "devops-ec2"
  }
}

# Provision Elastic IP
resource "aws_eip" "ec2_eip" {
  
  tags = {
    Name = "devops-ec2-eip"
  }
}

resource "aws_eip_association" "ec2_eip" {
    instance_id   = aws_instance.ec2.id
    allocation_id = aws_eip.ec2_eip.id
}