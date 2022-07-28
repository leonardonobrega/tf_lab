provider "aws" {
  region  = "sa-east-1"
  profile = "tf_profile"
}

variable "vpc_name" {
  type    = string
  default = "TerraFormVPC"
}

resource "aws_vpc" "TerraFormVPC" {
  cidr_block = "192.168.0.0/24"

  tags = {
    "Name" = var.vpc_name
  }
}
