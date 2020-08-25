resource "aws_vpc_peering_connection" "mgmt-to-nonprod" {
  peer_vpc_id   = aws_vpc.main.id
  vpc_id        = var.MGMT_VPC_ID
  auto_accept   = true

  tags = {
    Name = "mgmt-to-nonprod"
  }
}

/*resource "aws_route" "nonprod-private" {
  route_table_id            = aws_route_table.private-rt.id
  destination_cidr_block    = data.aws_vpc.management.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.mgmt-to-nonprod.id
  depends_on                = [aws_route_table.private-rt]
}

resource "aws_route" "nonprod-public" {
  route_table_id            = aws_route_table.public-rt.id
  destination_cidr_block    = data.aws_vpc.management.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.mgmt-to-nonprod.id
  depends_on                = [aws_route_table.public-rt]
}*/

resource "aws_route" "management" {
  count                     = length(tolist(data.aws_route_tables.mgmt-route-tables.ids))
  route_table_id            = element(tolist(data.aws_route_tables.mgmt-route-tables.ids),count.index)
  destination_cidr_block    = var.VPC_CIDR
  vpc_peering_connection_id = aws_vpc_peering_connection.mgmt-to-nonprod.id
}

