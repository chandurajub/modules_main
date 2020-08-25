resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  route {
    cidr_block = data.aws_vpc.management.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.mgmt-to-nonprod.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "public-subnets-association" {
  count          = length(data.aws_availability_zones.available.names)
  subnet_id      = element(aws_subnet.public-subnets.*.id, count.index)
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw.id
  }

  route {
    cidr_block = data.aws_vpc.management.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.mgmt-to-nonprod.id
  }

  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "private-subnets-association" {
  count          = length(data.aws_availability_zones.available.names)
  subnet_id      = element(aws_subnet.private-subnets.*.id, count.index)
  route_table_id = aws_route_table.private-rt.id
}