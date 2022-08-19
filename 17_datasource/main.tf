provider "aws" {
  region  = "sa-east-1"
  profile = "tf_profile"
}

resource "aws_instance" "db" {
  ami           = "ami-0a9e90bd830396d02"
  instance_type = "t2.micro"
  tags = {
    Name = "db-tf"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0a9e90bd830396d02"
  instance_type = "t2.micro"
  depends_on    = [aws_instance.db]
  tags = {
    Name = "web-tf"
  }
}

data "aws_instance" "dbsearch" {
  filter {
    name   = "tag:Name"
    values = ["db-tf"]
  }
}

output "dbservers" {
  value = data.aws_instance.dbsearch.availability_zone
}


