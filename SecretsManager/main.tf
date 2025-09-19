#store sensitive data securely using AWS Secrets Manager. 
#They need to create a secret with the following specifications:
#1) The secret name should be devops-secret.
#2) The secret value should contain a key-value pair with username: admin and password: Namin123.
#3) Use Terraform to create the secret in AWS Secrets Manager.

resource "aws_secretsmanager_secret" "devops_secret" {
  name = "devops-secret"  
}   
resource "aws_secretsmanager_secret_version" "secret_version" {
  secret_id = aws_secretsmanager_secret.devops_secret.id
  secret_string = jsonencode({
    username = "admin"
    password = "Namin123"
  })
}   

