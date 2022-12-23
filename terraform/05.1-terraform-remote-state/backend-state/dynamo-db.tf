resource "aws_dynamodb_table" "enterprise_backend_lock" {
    name = "dev_application_locks"
    billing_mode = "PAY_PER_REQUEST" # Several billing options, see documentation

    hash_key = "LockID"
    
    attribute {
        name = "LockID"
        type = "S" # String
    }
}