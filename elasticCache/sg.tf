resource "aws_security_group" "allow_redis_access" {
  name        = "allow_redis"
  description = "Allow redis access"
  vpc_id      = var.VPC_ID

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.main.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_redis_access"
  }
}