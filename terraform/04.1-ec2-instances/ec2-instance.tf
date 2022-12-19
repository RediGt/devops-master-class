resource "aws_instance" "http_server" {
  ami = data.aws_ami.aws_linux_2_latest.id # see "data-providers.tf"
#   ami = "ami-07bdb714a483cb3bc"
  key_name = "Stockholm-KP" # Key-Pair name
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.http_server_sg.id]
  subnet_id = data.aws_subnets.default_subnets.ids[0] # see "data-providers.tf"
#   subnet_id = "subnet-0d08e3d859cf8d928" # Networking -> VPC -> Subnets

  connection { # Setup details for connection to EC2
    type = "ssh"
    host = self.public_ip # Refer to instance itself
    user = "ec2-user" # User that is auto-created for each EC2
    private_key = file(var.aws_key_pair) # See "variables.tf"
  }

  provisioner "remote-exec" { # To execute commands inside EC2
    inline = [
      "sudo yum install httpd -y", # Install the server
      "sudo service httpd start", # Start the server
      "echo Welcome to in28minutes - Virtual Server is at ${self.public_dns} | sudo tee /var/www/html/index.html"
    ]
  }

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