variable "KKE_instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "datacenter-ec2"
}

variable "KKE_eip" {
  description = "Elastic IP for the EC2 instance"
  type        = string
  default     = "datacenter-eip"
}
