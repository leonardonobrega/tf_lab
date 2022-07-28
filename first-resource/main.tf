provider "aws" {
  region  = "sa-east-1"
  profile = "tf_profile"
}

resource "aws_vpc" "vpc_tf" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc_tf"
  }
}
