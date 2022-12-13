provider "aws" {
  region = "eu-north-1"
}

# CREATING IAM USERS WITH DEFINED COUNT
resource "aws_iam_user" "my_iam_users" {
  count = 3 # define resource count
  name = "my_iam_user_${count.index}" # ensure uniqueness
}