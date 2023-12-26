# define an aws security group named "web_haproxy"
resource "aws_security_group" "web_haproxy" {
  name        = "web_haproxy"
  description = "dynamic"
  vpc_id      = aws_vpc.vpc_web_haproxy.id # specify the vpc id where the security group belongs

  # dynamic security group (inbound rules)
  dynamic "ingress" {
    for_each = var.ingres_ports
    content {
      description = "WEB_HAProxy"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.ingress_cidr_blocks
    }
  }

  # llow traffic from the security group itself
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  # allow all outgoing traffic (outbound rules)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"             # -1 indicates all protocols
    cidr_blocks = var.egress_ports # allow traffic to all destinations
  }
  # assign tags to the security group for better identification
  tags = {
    Name = "Security_Group_HAProxy"
  }
}
