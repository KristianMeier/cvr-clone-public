resource "aws_route53_zone" "kkm_zone" {
  name = var.domain_name
}