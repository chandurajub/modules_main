resource "aws_security_group" "allow_rabbitmq_access" {
  name        = "allow_rabbitmq_access"
  description = "Allow rabbitmq Access"
  vpc_id      = var.VPC_ID

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.main.cidr_block,data.aws_vpc.management.cidr_block]
  }

  ingress {
    from_port   = 5672
    to_port     = 5672
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
    Name = "allow_rabbitmq_access"
  }
}
