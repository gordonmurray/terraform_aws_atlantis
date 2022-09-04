data "aws_ami" "atlantis" {
  most_recent = true

  filter {
    name   = "name"
    values = ["atlantis*"]
  }

  owners = [var.aws_account_id]
}

resource "aws_instance" "atlantis" {
  ami                     = data.aws_ami.atlantis.id
  instance_type           = "t3.micro"
  key_name                = aws_key_pair.key.key_name
  subnet_id               = var.subnet_id
  vpc_security_group_ids  = [aws_security_group.atlantis.id]
  disable_api_termination = true

  root_block_device {
    delete_on_termination = true
    encrypted             = true
    volume_size           = "10"
  }

  tags = {
    Name = "Atlantis"
  }

  metadata_options {
    http_tokens   = "required"
    http_endpoint = "enabled"
  }

  user_data = templatefile("${path.module}/create_env.sh", {
    my_aws_access_key     = var.my_aws_access_key
    my_aws_secret_key     = var.my_aws_secret_key
    github_user           = var.github_user
    github_token          = var.github_token
    github_webhook_secret = var.github_webhook_secret
    github_allow_list     = var.github_allow_list
    infracost_api_key     = var.infracost_api_key
  })

}
