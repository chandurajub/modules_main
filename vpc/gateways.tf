resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.TAGS["ENV"]
  }
}

resource "aws_eip" "nat-gw" {
  vpc      = true
}

resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.nat-gw.id
  subnet_id     = element(aws_subnet.public-subnets.*.id,0)
}