output "VPC_ID" {
  value = aws_vpc.main.id
}

output "PUBLIC_SUBNETS" {
  value = aws_subnet.public-subnets.*.id
}

output "PRIVATE_SUBNETS" {
  value = aws_subnet.private-subnets.*.id
}

output "MGMT_VPC_ID" {
  value = var.MGMT_VPC_ID
}