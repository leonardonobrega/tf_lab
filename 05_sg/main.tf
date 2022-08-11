provider "aws" {
  region  = "sa-east-1"
  profile = "tf_profile"
}

resource "aws_instance" "ec2" {
  ami             = "ami-0a9e90bd830396d02"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]

  tags = {
    Name = "ec2-tf"
  }

}

resource "aws_security_group" "webtraffic" {
  name = "Allow HTTPS"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
