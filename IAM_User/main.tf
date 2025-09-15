#For this task, create an IAM user named iamuser_yousuf using terraform.
#The Terraform working directory is /home/bob/terraform. 
#Create the main.tf file (do not create a different .tf file) to accomplish this task.

resource "aws_iam_user" "iamuser_yousuf" {
  name = "iamuser_yousuf"
  
}