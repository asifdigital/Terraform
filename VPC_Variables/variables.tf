
variable "KKE_vpc" {
  description = "Name of the VPC"
  type        = string
  default     = "nautilus-vpc"          
  
}   
variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

