#Use Terraform to:
#Create 3 EC2 instances using the count parameter.
#Name each EC2 instance with the prefix xfusion-instance (e.g., xfusion-instance-1).
#Instances should be t2.micro.
#The key named should be xfusion-key.

#Use variables.tf file with the following:
#KKE_INSTANCE_COUNT: number of instances.
#KKE_INSTANCE_TYPE: type of the instance.
#KKE_KEY_NAME: name of key used.
#KKE_INSTANCE_PREFIX: name of the instnace.

#Use the locals.tf file to define a local variable named AMI_ID that retrieves the latest Amazon Linux 2 AMI using a data source.
#Use terraform.tfvars to assign values to the variables.
#Use outputs.tf file to output the following:
#kke_instance_names: names of the instances created.

resource "tls_private_key" "kke_private_key" {
    algorithm = "RSA"
    rsa_bits  = 4096
  
}

resource "aws_key_pair" "kke_key" {
    key_name   = var.KKE_KEY_NAME
    public_key = tls_private_key.kke_private_key.public_key_openssh
    tags = {
      Name = var.KKE_KEY_NAME
    }
  
}

resource "local_file" "kke_key_file" {
    content  = tls_private_key.kke_private_key.private_key_pem
    filename = "/home/bob/${var.KKE_KEY_NAME}.pem"
    file_permission = "0400"
  
}


data "aws_vpc" "default" {
    default = true
}

data "aws_security_group" "default" {
    name = "default"
    vpc_id = data.aws_vpc.default.id
  
}

resource "aws_instance" "kke_instances" {
  count         = var.KKE_INSTANCE_COUNT
  ami           = local.AMI_ID
  instance_type = var.KKE_INSTANCE_TYPE
  key_name      = var.KKE_KEY_NAME
  vpc_security_group_ids = [ data.aws_security_group.default.id ]  

  tags = {
    Name = "${var.KKE_INSTANCE_PREFIX}-${count.index + 1}"
  }
  
}
