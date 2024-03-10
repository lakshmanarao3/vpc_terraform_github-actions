data "aws_ami" "tr-amazonLinux" {
  most_recent = true

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] 
}

data "aws_availability_zones" "available" {
    state = "available"
}