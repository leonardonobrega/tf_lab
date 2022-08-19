provider "aws" {
  region  = "sa-east-1"
  profile = "tf_profile"
}

resource "aws_vpc" "tf_vpc" {
  cidr_block = "10.0.0.0/16"
  tags       = { name = "vpctf" }
}

resource "aws_vpc" "tf_vpc_2" {
  cidr_block = "192.168.0.0/24"
  tags       = { name = "vpctf2" }
}
