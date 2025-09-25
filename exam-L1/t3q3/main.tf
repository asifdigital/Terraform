#create a secret with the following specifications:
#1) The secret name should be devops-secret-t3q3.
#2) The secret value should contain a key-value pair with username: admin and password: Namin123.
#3) Use Terraform to create the secret in AWS Secrets Manager.
#The Terraform working directory is /home/bob/terraform/t3q3. 


resource "aws_secretsmanager_secret" "devops_secret_t3q3" {
  name = "devops-secret-t3q3"
  
}

resource "aws_secretsmanager_secret_version" "devops_secret_t3q3_version" {
  secret_id     = aws_secretsmanager_secret.devops_secret_t3q3.id
  secret_string = jsonencode({
    username = "admin"
    password = "Namin123"
  })
}
