#The Elastic IP name datacenter-eip should be stored in a variable named KKE_eip.

variable "KKE_eip" {
  description = "Name of the Elastic IP"
  type        = string
  default     = "datacenter-eip"    
  
}