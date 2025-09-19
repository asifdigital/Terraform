#The IAM User name iamuser_mark should be stored in a variable named KKE_user.

resource "aws_iam_user" "KKE_user" {
  name = var.KKE_user   

  
}
