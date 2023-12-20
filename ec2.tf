# configure haproxy instance 
resource "aws_instance" "ec2_haproxy" {
  count                       = 1
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = "SSH"
  subnet_id                   = aws_subnet.subnet_public_web_haproxy.id
  vpc_security_group_ids      = [aws_security_group.web_haproxy.id]
  depends_on                  = [aws_instance.ec2_web_server]

  user_data = templatefile("haproxy.tpl", {
    instance_ip   = join(",", aws_instance.ec2_web_server.*.private_ip)
    instance_name = join(",", aws_instance.ec2_web_server.*.tags.Name)
  })

  tags = {
    Name = "haproxy"
  }
}

# configure web server instance 
resource "aws_instance" "ec2_web_server" {
  count                       = var.ec2_count
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = "SSH"
  subnet_id                   = aws_subnet.subnet_public_web_haproxy.id
  vpc_security_group_ids      = [aws_security_group.web_haproxy.id]

  user_data = templatefile("web_server.tpl", {})

  tags = {
    Name = "web_${format("%02d", count.index + 1)}"
  }
}


