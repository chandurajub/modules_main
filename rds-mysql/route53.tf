resource "aws_route53_record" "mysql" {
  zone_id = var.HOSTED_ZONE_ID
  name    = local.DNS_NAME
  type    = "CNAME"
  ttl     = "5"
  records = [aws_db_instance.mysql-instance.0.address]
}

locals{
  DNS_NAME = "mysql-${var.TAGS["PROJECT"]}-${var.TAGS["ENV"]}.${var.HOSTED_ZONE_NAME}"
}