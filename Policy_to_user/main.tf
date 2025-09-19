#An IAM user named iamuser_jim and a policy named iampolicy_jim already exists. 
#Use Terraform to attach the IAM policy iampolicy_jim to the IAM user iamuser_jim

# Create IAM user
resource "aws_iam_user" "user" {
  name = "iamuser_jim"

  tags = {
    Name = "iamuser_jim"
  }
}

# Create IAM Policy
resource "aws_iam_policy" "policy" {
  name        = "iampolicy_jim"
  description = "IAM policy allowing EC2 read actions for jim"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["ec2:Read*"]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "user_policy" {
  name       = "user_policy"
  users      = [aws_iam_user.user.name]
  policy_arn = aws_iam_policy.policy.arn
  
}