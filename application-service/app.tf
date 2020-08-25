module "ec2" {
  source          = "git::https://chandralekha882:Opcqa123!@github.com/chandralek/modules.git//ec2"
  VPC_ID          = var.VPC_ID
  MGMT_VPC_ID     = var.MGMT_VPC_ID
  PRIVATE_SUBNETS = var.PRIVATE_SUBNETS
  PUBLIC_SUBNETS  = var.PUBLIC_SUBNETS
  TAGS            = var.TAGS
  INSTANCE_TYPE   = var.INSTANCE_TYPE
  SG              = aws_security_group.security_group.id
  NAME_TAG        = "${var.APPLICATION_NAME}-${var.TAGS["PROJECT"]}-${var.TAGS["ENV"]}"
}

resource "null_resource" "Install_service" {
  triggers = {
    trigger = timestamp()
  }
  provisioner "remote-exec" {
    connection {
      host = module.ec2.PRIVATE_IP
      user = var.SSH_USR
      password = var.SSH_PSW
    }
    inline = [
      "yum install ansible -y ",
      "echo localhost >/tmp/hosts",
      "ansible-pull -i /tmp/hosts -U https://${var.GIT_USR}:${var.GIT_PSW}@github.com/chandralek/roboshop-project.git setup.yml -t ${var.APPLICATION_NAME} -e APPLICATION_ENVIRONMENT=${var.TAGS["ENV"]} -e DNS_DOMAIN_NAME=${trim(var.HOSTED_ZONE_NAME, ".")} -e LOGSTASH=172.31.37.140 -e RUSERNAME=${var.R_USR} -e RPASSWORD=${var.R_PSW} -e API_KEY=${var.API_KEY} -e LICENSE_KEY=${var.LICENSE_KEY}"
    ]
  }
}