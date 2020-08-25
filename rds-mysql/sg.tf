resource "aws_security_group" "allow_mysql_access" {
  name        = "allow_mysql_access"
  description = "Allow mysql Access"
  vpc_id      = var.VPC_ID

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.main.cidr_block,data.aws_vpc.management-vpc.cidr_block]
  }

  tags = {
    Name = "allow_mysql_access"
  }
}
