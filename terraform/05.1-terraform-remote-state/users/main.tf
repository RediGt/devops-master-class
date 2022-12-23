terraform {
  backend "s3" {
    bucket = "dev-applications-backend-state-redi-001"
    # key = "${var.application_name}-${var.project_name}-${var.environment}"
    key = "dev/backend-state/users/dev/backend-state-01"
    region = "eu-north-1"
    dynamodb_table = "dev_application_locks"
    encrypt = true
  }
}

provider "aws" {
  region = "eu-north-1"
}

# CREATING IAM USER
resource "aws_iam_user" "my_iam_user" {
  name = "${terraform.workspace}_my_iam_user"
}