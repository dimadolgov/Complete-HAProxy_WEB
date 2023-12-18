# define the aws vpc resource
resource "aws_vpc" "vpc_web_haproxy" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "vpc_web_haproxy"
  }
}
# fetch available aws availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

# create public subnets
resource "aws_subnet" "subnet_public_web_haproxy" {
 vpc_id            = aws_vpc.vpc_web_haproxy.id
 cidr_block        = var.subnet_cidr_public
 availability_zone = data.aws_availability_zones.available.names[0]
  tags  = {
   Name = "subnet_public_web_haproxy"
 }
}

# create internet gateway
resource "aws_internet_gateway" "internet_gateway_web_haproxy" {
 vpc_id = aws_vpc.vpc_web_haproxy.id
 
 tags = {
   Name = "internet_gateway_web_haproxy"
 }
}

# create public route table
resource "aws_route_table" "route_table_web_haproxy" {
 vpc_id = aws_vpc.vpc_web_haproxy.id
 
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.internet_gateway_web_haproxy.id
 }
 
 tags = {
   Name = "route_table_web_haproxy"
 }
}

# associate public subnet with the public route table
resource "aws_route_table_association" "public_subnet_associate" {
 subnet_id      = aws_subnet.subnet_public_web_haproxy.id
 route_table_id = aws_route_table.route_table_web_haproxy.id
}
