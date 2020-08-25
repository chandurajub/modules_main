resource "aws_elasticache_subnet_group" "redis-subnet-group" {
  name       = "robo-shop-redis-subnet-group-${lower(var.TAGS["ENV"])}"
  subnet_ids = tolist(var.PRIVATE_SUBNETS)
}