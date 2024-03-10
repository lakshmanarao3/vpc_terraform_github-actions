output "ec2_ids" {
  value = aws_instance.tr-vm.*.id
}