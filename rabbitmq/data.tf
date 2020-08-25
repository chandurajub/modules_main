data "aws_vpc" "main"{
  id = var.VPC_ID
}

data "aws_vpc" "management"{
  id = var.MGMT_VPC_ID
}