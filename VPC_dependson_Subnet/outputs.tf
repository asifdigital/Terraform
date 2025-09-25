#In outputs.tf, output the following:
#kke_vpc_name: The name of the VPC.
#kke_subnet_name: The name of the Subnet.

output "kke_vpc_name" {
  value = aws_vpc.kke_vpc_name.tags["Name"]
}
output "kke_subnet_name" {
  value = aws_subnet.kke_subnet_name.tags["Name"]
}
