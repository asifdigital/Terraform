# Use variables.tf file with the following variable names:
# KKE_VPC_CIDR for the VPC CIDR block.
# KKE_SUBNET_CIDR for the subnet CIDR block.

variable "KKE_VPC_CIDR" {  
    description = "CIDR block for the VPC"
    type        = string
    default     = "10.0.0.0/16"   
}


variable "KKE_SUBNET_CIDR" {  
    description = "CIDR block for the Subnet"
    type        = string
    default     = "10.0.1.0/24"   
}
