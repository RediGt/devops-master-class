provider "aws" {
  region = "eu-north-1"
}

# DEFINE VARIABLE
variable "iam_user_name_prefix" {
  type = string # any, number, bool, list, map, set, object, tuple
  default = "my_iam_user" # Default value of variable
}

# VAR-2. OVERRIDE default VAR from ENV
# SET ENV VARIABLE WITH PREFIX "TF_VAR_" + variable name
# export TF_VAR_iam_user_name_prefix=FROM_ENV_VARIABLE_IAM_PREFIX

# VAR-3. OVERRIDE default VAR and ENV var from "terraform.tfvars" FILE
# Check file and value

# VAR-4. OVERRIDE ALL VARs from COMMAND LINE
# terraform apply -var="iam_user_name_prefix=VALUE_FROM_COMMAND_LINE"

# CREATING IAM USERS WITH DEFINED COUNT
resource "aws_iam_user" "my_iam_users" {
  count = 3
  name = "${var.iam_user_name_prefix}_${count.index}" # variable usage
}