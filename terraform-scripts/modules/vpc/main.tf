#VPC
resource "aws_vpc" "tr-vpc" {
  cidr_block = var.vpc_cidr

}
#Subnet
resource "aws_subnet" "tr-subnets"{ 
  count = length(var.subnet_cidr)
  vpc_id = aws_vpc.tr-vpc.id
  cidr_block = var.subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.tr-azs.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name=var.subnet_names[count.index]
  }
}
#Internet Gateway
resource "aws_internet_gateway" "tr-gw" {
  vpc_id = aws_vpc.tr-vpc.id
  tags = {
    Name = "tr-gw"
  }
}
#Route Table
resource "aws_route_table" "tr-route" {
  vpc_id = aws_vpc.tr-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tr-gw.id
  }
  tags = {
    Name = "tr-route"
  }
}
#Route Table Association
resource "aws_route_table_association" "tr-route-association" {
  count=length(var.subnet_cidr)
  subnet_id      = aws_subnet.tr-subnets[count.index].id
  route_table_id = aws_route_table.tr-route.id
}