variable "vpc_id" {}

resource "aws_security_group" "bastion" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-sg"
  }
}

resource "aws_security_group" "app" {
  vpc_id = var.vpc_id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion.id]
  }

  tags = {
    Name = "app-sg"
  }
}

output "bastion_sg" {
  value = aws_security_group.bastion.id
}

output "app_sg" {
  value = aws_security_group.app.id
}