#For this task, create an AWS IAM role using Terraform with the following requirements:
#The IAM role name iamrole_john should be stored in a variable named KKE_iamrole.

variable "KKE_iamrole" {
  description = "Name of the IAM role"
  type        = string
  default     = "iamrole_john"
}
