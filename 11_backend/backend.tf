terraform {
  backend "s3" {
    key     = "terraform/tfstate.tfstate"
    bucket  = "lnobrega-terraform-bucket"
    region  = "sa-east-1"
    profile = "tf_profile"
  }
}
