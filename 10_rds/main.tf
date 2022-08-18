provider "aws" {
  region  = "sa-east-1"
  profile = "tf_profile"
}

resource "aws_db_instance" "db" {
  db_name             = "terraform_db"
  identifier          = "terraform-maria-db"
  instance_class      = "db.t2.micro"
  engine              = "mariadb"
  engine_version      = "10.6.8"
  username            = "tf"
  password            = "25131632"
  port                = 3306
  allocated_storage   = 20
  skip_final_snapshot = true
}
