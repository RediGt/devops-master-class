output "aws_security_group_http_server_details" {
  value = aws_security_group.http_server_sg
}

output "http_server_public_dns" {
  value = aws_instance.http_servers
}

output "load_balancer_public_dns" {
  value = aws_elb.load_balancer
}