resource "aws_route53_record" "redis" {
  zone_id = var.HOSTED_ZONE_ID
  name    = local.DNS_NAME
  type    = "CNAME"
  ttl     = "5"
  records = [aws_elasticache_cluster.redis-cluster.cache_nodes.0.address]
}

locals {
  DNS_NAME = "redis-${var.TAGS["PROJECT"]}-${var.TAGS["ENV"]}"
}