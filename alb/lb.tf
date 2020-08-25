resource "aws_lb" "frontend_alb" {
  name               = local.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security_group.id]
  subnets            = tolist(var.PUBLIC_SUBNETS)
  tags = {
    Name = local.alb_name
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.frontend_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_end_tg.arn
  }
}
