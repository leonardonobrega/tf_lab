provider "aws" {
  region  = "sa-east-1"
  profile = "tf_profile"
}

module "ec2module" {
  source  = "./ec2"
  ec2name = "ec2-from-module"
}

output "module_output" {
  value = module.ec2module.instance_id
}
