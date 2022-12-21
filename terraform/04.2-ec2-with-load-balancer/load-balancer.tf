resource "aws_elb" "load_balancer" {
  name = "loadBalancer"
  subnets = data.aws_subnets.default_subnets.ids
  security_groups = [aws_security_group.load_balancer_sg.id]
  instances = values(aws_instance.http_servers).*.id # all ec2 value IDs

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
}