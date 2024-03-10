resource "aws_security_group" "tr-sg" {
  name = "security-group"
  vpc_id = var.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    from_port =22
    to_port=22
    protocol="tcp"
    cidr_blocks=[var.my-pub-ip]
  }

  tags = {
    Name="tr-sg"
  }
}