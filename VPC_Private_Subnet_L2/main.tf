# Create a VPC named nautilus-priv-vpc with the CIDR block 10.0.0.0/16.
# Create a subnet named nautilus-priv-subnet inside the VPC with the CIDR block 10.0.1.0/24 
# and auto-assign IP option must not be enabled.
# Create an EC2 instance named nautilus-priv-ec2 inside the subnet and instance type must be t2.micro.
# Ensure the security group of the EC2 instance allows access only from within the VPC's CIDR block.
# Create the main.tf file (do not create a separate .tf file) to provision the VPC, subnet and EC2 instance.

# Use variables.tf file with the following variable names:
# KKE_VPC_CIDR for the VPC CIDR block.
# KKE_SUBNET_CIDR for the subnet CIDR block.

# Use the outputs.tf file with the following variable names:
# KKE_vpc_name for the name of the VPC.
# KKE_subnet_name for the name of the subnet.
# KKE_ec2_private for the name of the EC2 instance.

resource "aws_vpc" "nautilus_priv_vpc" {
  cidr_block = var.KKE_VPC_CIDR
  tags = {
    Name = "nautilus-priv-vpc"
  }
}

resource "aws_subnet" "nautilus_priv_subnet" {
  vpc_id            = aws_vpc.nautilus_priv_vpc.id
  cidr_block       = var.KKE_SUBNET_CIDR
  map_public_ip_on_launch = false
  tags = {
    Name = "nautilus-priv-subnet"
  }
}

resource "aws_security_group" "nautilus_priv_sg" {
  vpc_id = aws_vpc.nautilus_priv_vpc.id
  name   = "nautilus-priv-sg"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.KKE_VPC_CIDR]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    } 
}      

resource "aws_instance" "nautilus_priv_ec2" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.nautilus_priv_subnet.id

  vpc_security_group_ids = [aws_security_group.nautilus_priv_sg.id]
  tags = {
    Name = "nautilus-priv-ec2"
  }
}




