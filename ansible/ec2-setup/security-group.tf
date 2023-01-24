#  SECURITY GROUP: 80 TCP, 22 SSH
resource "aws_security_group" "http_server_sg" {
  name = "http_server_sg"
  vpc_id = aws_default_vpc.default.id # Create vpc.tf first
  # vpc_id = "vpc-04b69416f8c131564" # Hardcoded value

  ingress { # For HTTP
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { # For SSH
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress { # Allow all traffic
    from_port = 0
    to_port = 0
    protocol = "-1" # Allow all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "http_server_sg"
  }
}