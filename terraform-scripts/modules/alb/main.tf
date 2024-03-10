resource "aws_lb" "alb" {
  name               = "tf-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg-id]
  subnets = var.subnets
}

# listner
resource "aws_lb_listener" "tf-alb-listner" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tf-lb-tg.arn
  }
}

# Target Group
resource "aws_lb_target_group" "tf-lb-tg" {
  name     = "tf-alb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc-id
}

# Target group attachment
resource "aws_lb_target_group_attachment" "tf-tga" {
  count = length(var.ec2-ids)
  target_group_arn = aws_lb_target_group.tf-lb-tg.arn
  target_id        = var.ec2-ids[count.index]
  port             = 80
}