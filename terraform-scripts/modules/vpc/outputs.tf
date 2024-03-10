output "vpc_id" {
  value = aws_vpc.tr-vpc.id
}

output "subnet_ids" {
  value = aws_subnet.tr-subnets.*.id
}