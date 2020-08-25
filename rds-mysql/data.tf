data "aws_vpc" "main"{
  id  = var.VPC_ID
}

data "aws_vpc" "management-vpc"{
  id  = var.MGMT_VPC_ID
}