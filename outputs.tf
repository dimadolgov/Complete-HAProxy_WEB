output "Name" {
  value = aws_instance.ec2_web_server[*].tags.Name
}
output "instance_ids" {
  value = aws_instance.ec2_web_server[*].id
}
output "private_ip_addresses" {
  value = aws_instance.ec2_web_server[*].private_ip
}
output "public_ip_addresses" {
  value = aws_instance.ec2_web_server[*].public_ip
}

output "instance_ip" {
  value = aws_instance.ec2_web_server.*.private_ip
}

output "instance_name" {
  value = aws_instance.ec2_web_server.*.tags.Name
}
