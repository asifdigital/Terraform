#For this task, create a key pair using Terraform with the following requirements:
#Name of the key pair should be devops-kp-t1q1.
#Key pair type must be rsa.
#The private key file should be saved under /home/bob.

resource "tls_private_key" "devops" {
  algorithm = "RSA"
  rsa_bits  = 4096         
  
}

resource "aws_key_pair" "devops-kp-t1q1" {
    key_name   = "devops-kp-t1q1"
    public_key = tls_private_key.devops.public_key_openssh
    tags = {
        Name = "devops-kp-t1q1"
    }           
}

resource "local_file" "pemfile" {
  content  = tls_private_key.devops.private_key_pem
  filename = "/home/bob/devops-kp-t1q1.pem"
  file_permission = "0400"
}
