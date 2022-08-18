provider "aws" {
  region  = "sa-east-1"
  profile = "tf_profile"
}

resource "aws_vpc" "tf_vpc" {
  cidr_block = "10.0.0.0/16"
}
