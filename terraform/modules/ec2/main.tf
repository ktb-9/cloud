resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = var.ec2_instance_type
  subnet_id                   = var.subnet_id
  security_groups             = [var.instance_security_group]
  key_name                    = var.key_name

  tags = {
    Name = var.instance_name
  }
}