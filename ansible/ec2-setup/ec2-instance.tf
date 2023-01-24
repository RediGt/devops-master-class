resource "aws_instance" "http_server" {
  ami = data.aws_ami.aws_linux_2_latest.id # see "data-providers.tf"
#   ami = "ami-07bdb714a483cb3bc"
  count = 3
  key_name = "Stockholm-KP" # Key-Pair name
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.http_server_sg.id]
  subnet_id = data.aws_subnets.default_subnets.ids[0] # see "data-providers.tf"
#   subnet_id = "subnet-0d08e3d859cf8d928" # Networking -> VPC -> Subnets

  tags = {
    Name = "http_server_sg"
  }
}

# resource "aws_instance" "http_server" {
#   ami                    = "ami-07bdb714a483cb3bc"
#   key_name               = "default-ec2"
#   instance_type          = "t2.micro"
#   subnet_id              = "subnet-0d08e3d859cf8d928"
#   vpc_id                 = "vpc-04b69416f8c131564"