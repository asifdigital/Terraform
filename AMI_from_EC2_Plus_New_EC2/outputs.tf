# KKE_ami_id for the AMI ID you created.
# KKE_new_instance_id for the EC2 instance ID you created.

output "KKE_ami_id" {
  value = aws_ami_from_instance.new_ami.id
}   

output "KKE_new_instance_id" {
  value = aws_instance.new_ec2.id
  
}
