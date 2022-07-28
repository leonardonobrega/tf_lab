provider "aws" {
  region  = "sa-east-1"
  profile = "tf_profile"
}

variable "vpcname" {
  type    = string
  default = "vpc_tf"
}

variable "sshport" {
  type    = number
  default = 22
}

variable "enabled" {
  default = true
}

variable "mylist" {
  type    = list(string)
  default = ["Value1", "Value2"]
}

variable "mymap" {
  type = map(any)
  default = {
    Key1 = "Value1"
    Key2 = "Value2"
  }
}

variable "inputname" {
  type        = string
  description = "Set the name of the VPC"
}

resource "aws_vpc" "vpc_tf" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.inputname
  }
}

output "myoutput" {
  value = aws_vpc.vpc_tf.id
}

variable "mytuple" {
  type    = tuple([string, number, string])
  default = ["cat", 1, "dog"]
}

variable "myobj" {
  type = object({ name = string, port = list(number) })
  default = {
    name = "Leonardo"
    port = [22, 25, 80]
  }

}
