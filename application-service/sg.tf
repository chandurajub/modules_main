resource "aws_security_group" "security_group" {
  name        = local.sg_name
  description = "allow ${var.APPLICATION_NAME} service"
  vpc_id      = var.VPC_ID

  ingress {
    from_port   = var.PORTS["${var.APPLICATION_NAME}"]
    to_port     = var.PORTS[var.APPLICATION_NAME]
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.main.cidr_block,data.aws_vpc.management-vpc.cidr_block]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.main.cidr_block,data.aws_vpc.management-vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "allow_${var.APPLICATION_NAME}"
  }
}
