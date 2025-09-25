output "KKE_vpc_name" {
  value = aws_vpc.nautilus_priv_vpc.tags["Name"]
}

output "KKE_subnet_name" {
  value = aws_subnet.nautilus_priv_subnet.tags["Name"]
}
output "KKE_ec2_private" {
  value = aws_instance.nautilus_priv_ec2.tags["Name"]
}
