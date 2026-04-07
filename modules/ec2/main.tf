variable "public_subnet" {}
variable "private_subnet" {}
variable "bastion_sg" {}
variable "app_sg" {}

resource "aws_instance" "bastion" {
  ami           = "ami-020510cc1127d41e9"
  instance_type = "t3.micro"
  subnet_id     = var.public_subnet

  vpc_security_group_ids = [var.bastion_sg]

  tags = {
    Name = "bastion-host"
  }
}

resource "aws_instance" "app" {
  ami           = "ami-020510cc1127d41e9"
  instance_type = "t3.micro"
  subnet_id     = var.private_subnet

  vpc_security_group_ids = [var.app_sg]

  tags = {
    Name = "app-server"
  }
}
