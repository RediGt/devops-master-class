# Terraform
## Commands Executed
```
1) brew install terraform
2) terraform --version
3) terraform version
4) terraform init                               # run in project directory with main.tf
5) export AWS_ACCESS_KEY_ID=*******
   export AWS_SECRET_ACCESS_KEY=*********
6) terraform plan                               # simulate action
7) terraform apply                              # execute command
8) terraform console                            # enter console (>exit)
9) terraform apply -refresh=false               # compare main.tf state with last recorded state (terraform.tfstate)
10) terraform plan -out iam.tfplan              # save main.tf to iam.tfplan
11) terraform apply "iam.tfplan"                # create resources from tfplan file
12) terraform apply -target="aws_iam_user.my_iam_user" # update/execute specific resource from main.tf
13) terraform destroy                           # remove all resources from the cloud
14) terraform validate                          # check template for errors
15) terraform fmt                               # autoformats templates
16) terraform show                              # print present state of resources (.tfstate)
17) export TF_VAR_iam_user_name_prefix=FROM_ENV_VARIABLE_IAM_PREFIX # define TF variables as ENV variables
18) terraform plan -refresh=false -var="iam_user_name_prefix=VALUE_FROM_COMMAND_LINE" # Highest priority - override variables from command line
19) terraform plan -var-file="some-file.tfvars" # apply variables from custom file
20) terraform apply -target=aws_default_vpc.default # update/execute specific resource
21) terraform apply -target=data.aws_subnets.default_subnets # project 04.2 - necessaty preliminary step
<!-- terraform apply -target=data.aws_ami_ids.aws_linux_2_latest_ids -->
<!-- terraform apply -target=data.aws_ami.aws_linux_2_latest -->
22) terraform workspace show                    # current workspace
23) terraform workspace new prod-env            # set new workspace
24) terraform workspace select default          # switch to defined workspace
25) terraform workspace list                    # get all terraform workspaces
```