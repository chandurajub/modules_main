module "ec2" {
  source          = "git::https://chandralekha882:Opcqa123!@github.com/chandralek/modules.git//ec2"
  VPC_ID          = var.VPC_ID
  MGMT_VPC_ID     = var.MGMT_VPC_ID
  PRIVATE_SUBNETS = var.PRIVATE_SUBNETS
  PUBLIC_SUBNETS  = var.PUBLIC_SUBNETS
  TAGS            = var.TAGS
  INSTANCE_TYPE   = var.INSTANCE_TYPE
  SG              = aws_security_group.allow_mongodb_access.id
  NAME_TAG        = local.NAME_TAG
}

resource "null_resource" "mongodb_instance_ssh" {
  triggers = {
    trigger = timestamp()
  }
  connection {
    host = module.ec2.PRIVATE_IP
    user = var.SSH_USR
    password = var.SSH_PSW
  }
  provisioner "remote-exec" {
    inline = [
    "yum install ansible -y",
    "echo localhost>/tmp/hosts",
    "ansible-pull -i /tmp/hosts -U https://${var.GIT_USR}:${var.GIT_PSW}@github.com/chandralek/roboshop-project.git setup.yml -t mongodb"]
  }
}