provider "aws" {
  region  = "sa-east-1"
  profile = "tf_profile"
}

resource "aws_instance" "ec2" {
  ami           = "ami-0a9e90bd830396d02"
  instance_type = "t2.micro"
  tags = {
    Name = "ec2-tf"
  }
}


