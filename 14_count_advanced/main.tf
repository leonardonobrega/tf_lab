provider "aws" {
  region  = "sa-east-1"
  profile = "tf_profile"
}

module "db" {
  source       = "./db"
  server_names = ["mariadb", "mysql", "mssql"]
}

output "private_ips" {
  value = module.db.PrivateIP
}
