resource "null_resource" "mysql-schema-load" {
  count  = var.NONPROD ? 1 : 0
  triggers = {
    trigger = timestamp()
  }
  provisioner "local-exec" {
    command = <<EOF
git clone https://${var.GIT_USR}:${var.GIT_PSW}@github.com/chandralek/mysql.git
cd mysql
mysql -h ${element(aws_db_instance.mysql-instance.*.address,count.index)} -u ${var.DBUSER} -p${var.DBPASS} <shipping.sql
mysql -h ${element(aws_db_instance.mysql-instance.*.address,count.index)} -u ${var.DBUSER} -p${var.DBPASS} <ratings.sql
EOF
  }
}