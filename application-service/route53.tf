resource "aws_route53_record" "routerecord" {
  zone_id = var.HOSTED_ZONE_ID
  name    = local.DNS_NAME
  type    = "A"
  ttl     = "5"
  records = [module.ec2.PRIVATE_IP]
}

locals{
  DNS_NAME = "${var.APPLICATION_NAME}-${var.TAGS["ENV"]}.${var.HOSTED_ZONE_NAME}"
}