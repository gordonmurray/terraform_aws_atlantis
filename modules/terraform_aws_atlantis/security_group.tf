resource "aws_security_group" "atlantis" {
  name        = "atlantis"
  description = "atlantis security group"
  vpc_id      = var.vpc_id
}
