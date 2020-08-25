resource "aws_route53_record" "frontend" {
  zone_id = "Z06359783V969HYMH8KRR"
  name    = local.route_name
  type    = "CNAME"
  ttl     = "5"
  records = [aws_lb.frontend_alb.dns_name]
}