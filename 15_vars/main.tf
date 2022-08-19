provider "aws" {
  region  = "sa-east-1"
  profile = "tf_profile"
}

variable "number_of_servers" {
  type = number
}

resource "aws_instance" "ec2" {
  ami           = "ami-0a9e90bd830396d02"
  instance_type = "t2.micro"
  count         = var.number_of_servers
}


