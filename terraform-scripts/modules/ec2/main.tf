resource "aws_instance" "tr-vm" {
  ami = data.aws_ami.tr-amazonLinux.id
  count = length(var.ec2-names)
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.sgs_id]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  associate_public_ip_address = true
  subnet_id = var.subnets[count.index]
  key_name = aws_key_pair.tf-keypair.key_name
  tags = {
    Name = var.ec2-names[count.index]
  }
}

resource "aws_key_pair" "tf-keypair" {
  key_name   = "deployer-key"
  public_key = var.public-key
}