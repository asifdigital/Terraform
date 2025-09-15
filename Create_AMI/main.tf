#For this task, create an AMI from an existing EC2 instance named xfusion-ec2 using Terraform.
#Name of the AMI should be xfusion-ec2-ami, make sure AMI is in available state.


# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-f303ab5463421fba7"
  ]

  tags = {
    Name = "xfusion-ec2"
  }
}

# data "aws_instance" "xfusion-ec2" {
#     filter {
#         name   = "tag:Name"
#         values = ["xfusion-ec2"]
#     }
# }

resource "aws_ami_from_instance" "xfusion-ec2-ami" {
  name               = "xfusion-ec2-ami"
  source_instance_id =  aws_instance.ec2.id
  snapshot_without_reboot = false
}