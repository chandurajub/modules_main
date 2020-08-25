resource "aws_elasticache_cluster" "redis-cluster" {
  cluster_id           = "redis-cluster-${lower(var.TAGS["ENV"])}"
  engine               = "redis"
  node_type            = var.NODE_TYPE
  num_cache_nodes      = var.NUMBER_OF_NODES
  parameter_group_name = aws_elasticache_parameter_group.redis-5-0-6-pg.name
  engine_version       = "5.0.6"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.redis-subnet-group.name
  security_group_ids   = [aws_security_group.allow_redis_access.id]
}