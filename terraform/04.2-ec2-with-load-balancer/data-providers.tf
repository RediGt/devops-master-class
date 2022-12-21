# GETTING SUBNETS TO REMOVE HARDCOEDE VALUE IN "ec2-instance.tf"
data "aws_subnets" "default_subnets" {
  filter {
    name   = "vpc-id"
    values = [aws_default_vpc.default.id] # Create vpc.tf first
  }
}

# AVOID HARDCODING ami
data "aws_ami" "aws_linux_2_latest" {
  most_recent = true # Download latest image
  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm*"]
  }
}