resource "aws_elasticache_parameter_group" "redis-5-0-6-pg" {
  name   = "redis-parameter-group-5-0-6-pg"
  family = "redis5.0"
}