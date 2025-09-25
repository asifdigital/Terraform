output "KKE_instance_name" {
  value = aws_instance.ec2_instance.tags["Name"]
  
}

output "KKE_eip" {
  value = aws_eip.ec2_eip.public_ip
  
}