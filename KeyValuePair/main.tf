#Generate a new RS private key
resource "tls_private_key" "datacenter" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

#Create AWS key pair with the public key
resource "aws_key_pair" "datacenter" {
  key_name   = "datacenter-kp"
  public_key = tls_private_key.datacenter.public_key_openssh
  tags = {
    Name = "datacenter-kp"
  }
}

#Save the the private key to a file
resource "local_file" "pemfile" {
  content  = tls_private_key.datacenter.private_key_pem
  filename = "/home/bob/datacenter-kp.pem"
  file_permission = "0400"

}