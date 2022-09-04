resource "aws_route53_record" "atlantis" {
  zone_id = var.domain_zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = 300
  records = [aws_instance.atlantis.public_ip]
}