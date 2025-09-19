#discovered that one of the EC2 instances was underutilized,
#prompting them to decide to change the instance type. Please make sure the Status check is 
#completed (if it's still in Initializing state) before making any changes to the instance.
#Change the instance type from t2.micro to t2.nano for xfusion-ec2 instance using terraform.
#Make sure the EC2 instance xfusion-ec2 is in running state after the change.

# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  subnet_id     = ""
  vpc_security_group_ids = [
    "sg-6d31b68d1d695148a"
  ]

  tags = {
    Name = "xfusion-ec2"
  }
}

# Update instance configuration
resource "aws_instance" "ec2_new" {
  ami           = aws_instance.ec2.ami
  instance_type = "t2.nano"  # Changed from t2.micro
  vpc_security_group_ids = [
    "sg-6d31b68d1d695148a"
  ]
  
  # Instance state management
  instance_state = "running"

  tags = {
    Name = "xfusion-ec2"
  }

  # Stop instance before type change
  lifecycle {
    create_before_destroy = true
  }
}