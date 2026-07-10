resource "aws_dynamodb_table" "dynamodb-table" {
  name           = "secure-state-management-table"
  billing_mode   = "PAY_PER_REQUEST" 
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name     = "secure-state-management-table"
  }
}