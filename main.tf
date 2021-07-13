# Terraform configuration

provider "aws" {
  region = "ap-east-1"
}

module "my_ec2" {
  source = "./modules/my-ec2"
}