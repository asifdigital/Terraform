# They have an existing EC2 instance named xfusion-ec2.
# They need to create an AMI named xfusion-ec2-ami from this instance.
# Additionally, they need to launch a new EC2 instance named xfusion-ec2-new using this AMI.
# Update the main.tf file (do not create a different or separate.tf file) to provision an AMI and then launch an EC2 Instance from that AMI.
# Create an outputs.tf file to output the following values:
# KKE_ami_id for the AMI ID you created.
# KKE_new_instance_id for the EC2 instance ID you created.


# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-d8e39f446b5c2f78a"
  ]

  tags = {
    Name = "nautilus-ec2"
  }
}

resource "aws_ami_from_instance" "new_ami"  {
    name               = "nautilus-ec2-ami"
    source_instance_id = aws_instance.ec2.id
    depends_on = [ aws_instance.ec2 ]  
}


# Provision EC2 instance
data "aws_vpc" "default" {
  default=true
}

data "aws_security_group" "default" {
    name = "default"
    vpc_id = data.aws_vpc.default.id
}

resource "aws_instance" "new_ec2" {
  ami           = aws_ami_from_instance.new_ami.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [ data.aws_security_group.default.id ] 

  tags = {
    Name = "nautilus-ec2-new"
  }         

  depends_on = [ aws_ami_from_instance.new_ami ]
  
}
