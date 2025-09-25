#Use variables.tf file with the following:
#KKE_INSTANCE_COUNT: number of instances.
#KKE_INSTANCE_TYPE: type of the instance.
#KKE_KEY_NAME: name of key used.
#KKE_INSTANCE_PREFIX: name of the instnace.

variable "KKE_INSTANCE_COUNT" {
  description = "Number of EC2 instances to create"
  type        = number   
}

variable "KKE_INSTANCE_TYPE" {
  description = "Type of the EC2 instance"
  type        = string
   
}

variable "KKE_KEY_NAME" {
  description = "Name of the key pair to use for the instances"
  type        = string
  
}

variable "KKE_INSTANCE_PREFIX" {
  description = "Prefix for the EC2 instance names"
  type        = string
    
}
