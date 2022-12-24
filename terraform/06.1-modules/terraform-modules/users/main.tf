variable "environment" {
  default = "default"
}

provider "aws" {
  region = "eu-north-1"
}

# CREATING IAM USER
resource "aws_iam_user" "my_iam_user" {
  name = "${local.iam_user_extension}_${var.environment}"
}

# VARIABLE ONLY FOR CURRENT MODULE
# Cannot be overriden in comparison to "variable"
locals {
  iam_user_extension = "my_iam_user_abc"
}