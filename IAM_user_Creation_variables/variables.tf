#The IAM User name iamuser_mark should be stored in a variable named KKE_user.

variable "KKE_user" {
  description = "The name of the IAM user"
  type        = string
  default     = "iamuser_mark"
}

