variable "vpc_id" {
  type        = string
  description = "VPC ID to use"
}

variable "aws_account_id" {
  type        = string
  description = "AWS Account ID to use to find the AMI"
}

variable "aws_region" {
  type        = string
  description = "AWS region to use"
  default     = "eu-west-1"
}

variable "subnet_id" {
  type        = string
  description = "AWS subnet to use"
  default     = "eu-west-1"
}

variable "my_ip_address" {
  type = string
}

variable "my_aws_access_key" {
  type = string
}

variable "my_aws_secret_key" {
  type = string
}

variable "github_user" {
  type = string
}

variable "github_token" {
  type = string
}

variable "github_webhook_secret" {
  type = string
}

variable "github_allow_list" {
  type = string
}

variable "infracost_api_key" {
  type = string
}
