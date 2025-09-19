#The IAM policy name iampolicy_john should be stored in a variable named KKE_iampolicy.

variable "KKE_iampolicy" {
  description = "Name of the IAM policy"
  type        = string
  default     = "iampolicy_john"    
  
}