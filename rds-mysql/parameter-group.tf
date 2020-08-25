resource "aws_db_parameter_group" "parameter-group" {
  name   = "rds-pg"
  family = "mysql5.7"
}