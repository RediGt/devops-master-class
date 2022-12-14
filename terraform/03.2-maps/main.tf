provider "aws" {
  region = "eu-north-1"
}

# DEFINE VARIABLE
variable "users" {
  default = {
    ravs : { country : "Netherlands", department : "IT" },
    tom : { country : "US", department : "Accounting" },
    jane : { country : "India", department : "IT" }
  }
}

# CREATING IAM USERS FROM LIST USING "for-each"
resource "aws_iam_user" "my_iam_users" {
  for_each = var.users
  name = each.key
  tags = {
    country : each.value.country
    department : each.value.department
  }
}