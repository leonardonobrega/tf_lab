provider "aws" {
  region  = "sa-east-1"
  profile = "tf_profile"
}

variable "ingressrules" {
  type    = list(number)
  default = [80, 443]
}

variable "egressrules" {
  type    = list(number)
  default = [80, 443]
}

resource "aws_instance" "db" {
  ami             = "ami-0a9e90bd830396d02"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]

  tags = {
    Name = "db"
  }
}

resource "aws_instance" "web" {
  ami             = "ami-0a9e90bd830396d02"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]
  user_data       = file("server-script.sh")

  tags = {
    Name = "web"
  }
}

resource "aws_eip" "web_ip" {
  instance = aws_instance.web.id
}

resource "aws_security_group" "webtraffic" {
  name = "Allow Web Traffic"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

output "PrivateIP" {
  value = aws_instance.db.private_ip
}

output "PublicIP" {
  value = aws_eip.web_ip.public_ip
}
