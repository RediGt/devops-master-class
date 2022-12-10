provider "aws" {
  region = "eu-north-1"
}

# OBJECT TO CREATE "TYPE-OF-RESOURCE" "TERRAFORM-NAME"
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "redi-s3-bucket-002"
}

# ADDING VERSIONING
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# CREATING IAM USER
resource "aws_iam_user" "my_iam_user" {
  name = "my_iam_user_abc"
}

# LOGGING VARIABLES (OBJECTS) IN TERMINAL
output "my_s3_bucket_versioning" {
    value = aws_s3_bucket.my_s3_bucket.versioning[0].enabled
}

output "my_s3_bucket_complete_details" {
    value = aws_s3_bucket.my_s3_bucket
}

output "my_iam_user_complete_details" {
    value = aws_iam_user.my_iam_user
}