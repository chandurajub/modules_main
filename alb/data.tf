data "aws_vpc" "main" {
  id = var.VPC_ID
}

data "aws_vpc" "management-vpc"{
  id  = var.MGMT_VPC_ID
}

data "aws_instances" "frontend-instances" {
  instance_tags = {
    Name = "frontend-roboshop-${var.TAGS["ENV"]}"
  }
  instance_state_names = ["running"]
}