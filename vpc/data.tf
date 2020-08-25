data "aws_availability_zones" "available" {
  state = "available"
}


data "aws_vpc" "management" {
  id = var.MGMT_VPC_ID
}

data "aws_route_tables" "mgmt-route-tables" {
  vpc_id = var.MGMT_VPC_ID
}