data "aws_vpc" "main"{
  id  = var.VPC_ID
}

data "aws_vpc" "management" {
  id = var.MGMT_VPC_ID
}

data "aws_ami" "centos" {
  most_recent      = true
  name_regex       = "^Centos-7-DevOps-Practice"
  owners           = ["973714476881"]
}
