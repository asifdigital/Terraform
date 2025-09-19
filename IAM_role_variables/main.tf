
resource "aws_iam_role" "KKE_iamrole" {
  name = var.KKE_iamrole    # Variable used here for the IAM role name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
    
}
