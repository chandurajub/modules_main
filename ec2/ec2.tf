resource "aws_instance" "ec2-instance" {
  ami                     = data.aws_ami.centos.id
  instance_type           = var.INSTANCE_TYPE
  subnet_id               = element(var.PRIVATE_SUBNETS, 0)
  vpc_security_group_ids  = [var.SG]
  tags                    = {
    Name                  = var.NAME_TAG
  }
}
