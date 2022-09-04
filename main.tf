terraform {

  required_version = "1.2.3"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "4.20.0"

    }
  }

}

# Configure the AWS Provider
provider "aws" {
  region                   = var.aws_region
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "gordonmurray"

  default_tags {
    tags = {
      Repo = "https://github.com/gordonmurray/terraform_aws_atlantis"
    }
  }
}


module "atlantis" {
  source = "./modules/terraform_aws_atlantis"

  # Infrastructure related variables
  vpc_id         = var.vpc_id
  subnet_id      = var.subnet_id
  aws_account_id = var.aws_account_id
  my_ip_address  = var.my_ip_address

  # variables needed for Atlantis / Infracost
  my_aws_access_key     = var.my_aws_access_key
  my_aws_secret_key     = var.my_aws_secret_key
  github_user           = var.github_user
  github_token          = var.github_token
  github_webhook_secret = var.github_webhook_secret
  github_allow_list     = var.github_allow_list
  infracost_api_key     = var.infracost_api_key
}
