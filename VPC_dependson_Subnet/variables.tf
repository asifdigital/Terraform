#Use variables.tf, define the following variables:
#KKE_VPC_NAME for the VPC name.
#KKE_SUBNET_NAME for the Subnet name.
#Use terraform.tfvars to input the names of the VPC and subnet.

variable "KKE_VPC_NAME" {
  description = "The name of the VPC"
  type        = string
}   

variable "KKE_SUBNET_NAME" {
  description = "The name of the Subnet"
  type        = string
}

