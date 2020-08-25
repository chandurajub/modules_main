resource "aws_db_instance" "mysql-instance" {
  count                = var.NONPROD ? 1 : 0
  identifier           = "${var.TAGS["PROJECT"]}-${var.TAGS["ENV"]}"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = var.INSTANCE_TYPE
  username             = var.DBUSER
  password             = var.DBPASS
  parameter_group_name = aws_db_parameter_group.parameter-group.name
  db_subnet_group_name = aws_db_subnet_group.mysql-subnet-group.name
  vpc_security_group_ids = [aws_security_group.allow_mysql_access.id]
  skip_final_snapshot   = true
}

resource "aws_rds_cluster" "default" {
  count                   = var.PROD ? 1 : 0
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.03.2"
  availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name           = "mydb"
  master_username         = "foo"
  master_password         = "bar"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
}