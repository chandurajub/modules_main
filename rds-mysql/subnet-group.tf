resource "aws_db_subnet_group" "mysql-subnet-group" {
  name       = "mysql-subnet-group"
  subnet_ids = tolist(var.PRIVATE_SUBNETS)

  tags = {
    Name = "My DB subnet group"
  }
}