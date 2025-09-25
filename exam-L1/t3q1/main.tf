#create a DynamoDB table with the following specifications:
#1) The table name should be devops-users-t3q1.
#2) The primary key should be devops_id_t3q1 (String).
#3) The table should use PAY_PER_REQUEST billing mode.
#Use Terraform to create this DynamoDB table. The Terraform working directory is /home/bob/terraform/t3q1.

resource "aws_dynamodb_table" "devops_users_t3q1" {
  name           = "devops-users-t3q1"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "devops_id_t3q1"

  attribute {
    name = "devops_id_t3q1"
    type = "S"
  }
}   

