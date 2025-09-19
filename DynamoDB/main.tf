#create a DynamoDB table with the following specifications:
#1) The table name should be datacenter-users.
#2) The primary key should be datacenter_id (String).
#3) The table should use PAY_PER_REQUEST billing mode.


resource "aws_dynamodb_table" "datacenter-users" {
  name           = "datacenter-users"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "datacenter_id"

  attribute {
    name = "datacenter_id"
    type = "S"
  }
  tags = {
    Name        = "datacenter-users"
  }
}   

