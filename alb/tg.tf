resource "aws_lb_target_group" "front_end_tg" {
  name     = "front-end-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.main.id
}

resource "aws_lb_target_group_attachment" "front_end_tg_attachment" {
  count            = length(data.aws_instances.frontend-instances.ids)
  target_group_arn = aws_lb_target_group.front_end_tg.arn
  target_id        = element(data.aws_instances.frontend-instances.ids,count.index)
  port             = 80
}
