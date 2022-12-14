provider "aws" {
  region = "eu-north-1"
}

# DEFINE VARIABLE
variable "names" {
  default = ["ranga", "tom", "jane"] # Default value of variable
}

# CREATING IAM USERS FROM LIST
# resource "aws_iam_user" "my_iam_users" {
#   count = length(var.names) # count equals "names"-count
#   name = var.names[count.index] # variable usage
# }

# CREATING IAM USERS FROM LIST USING "for-each" - PREFERABLE
resource "aws_iam_user" "my_iam_users" {
  for_each = toset(var.names) # foreach is not working with lists
  name = each.value # making resources for each name
}